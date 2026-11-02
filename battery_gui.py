"""Chinese desktop UI for the existing BM5235 native threshold controller.

Startup and the five-second battery refresh use Windows APIs only. EC access
is always a deliberate button action, runs in one background thread, and uses
the existing controller's mutex, transaction checks and failure behavior.
"""
import argparse
import contextlib
import ctypes
from dataclasses import dataclass
from datetime import datetime
import io
import json
import os
from pathlib import Path
import queue
import subprocess
import sys
import threading
import tkinter as tk
from tkinter import colorchooser, scrolledtext, ttk

import bm5235_battery as battery
import bm5235_native as native
import battery_telemetry as telemetry
import bm5235_lighting as lighting
import bm5235_cpu as cpu_control


APP_NAME = "蛟龙16Pro电池充电阈值"
RESOURCE_DIR = Path(__file__).resolve().parent
RESOURCE_FILES = ("BM5235ECBridge.exe", "WinRing0x64.dll", "WinRing0x64.sys")
OPERATIONS = {"inspect": "读取 EC 状态", "enable": "启用充电阈值", "disable": "恢复默认充电"}
LIGHTING_OPERATIONS = {"lighting_read": "读取灯光设置", "lighting_rgb": "应用 RGB 颜色",
                       "lighting_mode": "应用灯效模式"}
CPU_OPERATIONS = {"cpu_read": "读取 CPU 设置", "cpu_apply": "应用 CPU 自定义设置",
                  "cpu_restore": "恢复 CPU 原厂档位"}
PHASES = {
    "before": "已读取操作前状态",
    "normal_policy_prepared": "已恢复普通充电，准备配置",
    "native_state_cleanup_started": "正在清理旧的初始化状态",
    "native_state_cleanup_complete": "初始化状态清理完成",
    "native_submitted": "阈值已提交并回读确认",
    "native_reused": "相同阈值已经启用，回读确认完成",
    "unexpected_discharge_restored": "检测到意外放电，已恢复默认充电",
    "exit_notice": "操作中断，配置可能保留；请读取状态后再决定是否恢复默认",
}
BG, CARD, INK, MUTED, ACCENT = "#F2F5F9", "#FFFFFF", "#18263B", "#607087", "#2563EB"


def is_admin():
    return os.name == "nt" and bool(ctypes.windll.shell32.IsUserAnAdmin())


def default_log_dir():
    base = Path(os.environ.get("LOCALAPPDATA", str(Path.home())))
    return base / "BatteryThreshold" / "logs"


def validate_thresholds(low, high):
    try:
        low, high = int(str(low)), int(str(high))
    except (ValueError, TypeError):
        raise ValueError("请输入整数百分比，例如 60 和 80。") from None
    if not 0 < low < high <= 100:
        raise ValueError("阈值需要满足：1 ≤ 开始充电 < 停止充电 ≤ 100。")
    return low, high


def format_rates(data):
    """Keep unknown rates distinct from measured zero; respect relative units."""
    cells = data.get("batteries", []) if data.get("available") else []
    if not cells or any(not isinstance(cell, dict) for cell in cells):
        return "--", "--", "暂时无法读取充放电速率"
    units = {cell.get("RateUnit", "unknown") for cell in cells}
    if len(cells) > 1 and units != {"mW"}:
        return "--", "--", "多块电池的速率单位无法合并"

    def rate(field):
        values = [cell.get(field) for cell in cells]
        if not all(telemetry.known_rate(value) for value in values):
            return "--"
        value = sum(values)
        if units == {"mW"}:
            return f"{value / 1000:.2f} W"
        if units == {"relative"}:
            return f"{value} 相对单位/h"
        return f"{value}（原始值）"

    charge, discharge = rate("ChargeRate"), rate("DischargeRate")
    hint = "Windows 电池报告"
    if units != {"mW"}:
        hint += " · 未换算功率"
    if "--" in (charge, discharge):
        hint += " · 部分速率未知"
    return charge, discharge, hint


def launch_as_admin():
    """Source launches also request UAC; the distributed EXE has an admin manifest."""
    args = sys.argv[1:] if getattr(sys, "frozen", False) else [str(Path(__file__).resolve()), *sys.argv[1:]]
    key = "PYINSTALLER_RESET_ENVIRONMENT"
    old = os.environ.get(key)
    os.environ[key] = "1"
    try:
        shell = ctypes.WinDLL("shell32", use_last_error=True).ShellExecuteW
        shell.argtypes = [ctypes.c_void_p, ctypes.c_wchar_p, ctypes.c_wchar_p,
                          ctypes.c_wchar_p, ctypes.c_wchar_p, ctypes.c_int]
        shell.restype = ctypes.c_void_p
        code = shell(None, "runas", sys.executable, subprocess.list2cmdline(args), str(RESOURCE_DIR), 1)
        if not code or code <= 32:
            raise OSError("管理员启动未完成，可能已取消权限请求。")
    finally:
        if old is None:
            os.environ.pop(key, None)
        else:
            os.environ[key] = old


def resource_check():
    paths = {name: RESOURCE_DIR / "Windows" / name for name in RESOURCE_FILES}
    missing = [name for name, path in paths.items() if not path.is_file()]
    if missing:
        raise FileNotFoundError("缺少运行文件：" + "、".join(missing))
    return paths


def friendly_error(error):
    translations = (
        ("Default requires SOC <", "当前电量已达到或超过上限。请先自然放电至上限以下，再接通电源启用。"),
        ("Connect AC", "请接通电源适配器后重试。"),
        ("Another prototype process", "另一个电池控制程序正在运行。请先退出该程序。"),
        ("status=2", "驱动未能加载。请确认已使用管理员权限；若被系统拦截，请保留系统安全设置并查看日志。"),
        ("status=3", "驱动文件未找到，请检查程序包是否完整。"),
        ("readings disagree", "EC 与 Windows 的电量或电源状态不一致，本次操作已停止。"),
        ("Battery presence", "未能确认电池状态，本次操作已停止。"),
        ("unknown battery mode", "检测到未知电池模式，本次操作已停止。"),
        ("Unexpected discharge", "检测到意外放电，原生限充已关闭并恢复默认充电。"),
        ("timeout", "EC 通信超时，已停止操作。请先读取状态，再决定是否恢复默认。"),
    )
    for fragment, message in translations:
        if fragment.lower() in str(error).lower():
            return message
    return "操作未完成：" + str(error)


@dataclass(frozen=True)
class OperationResult:
    operation: str
    success: bool
    log_path: Path
    error: str = ""


class EventStream(io.TextIOBase):
    """Capture the controller's JSON output without requiring a console."""
    def __init__(self, log, events):
        self.log, self.events, self.pending = log, events, ""

    def write(self, text):
        self.log.write(text)
        self.log.flush()
        self.pending += text
        while "\n" in self.pending:
            line, self.pending = self.pending.split("\n", 1)
            if line.strip():
                try:
                    event = json.loads(line)
                except ValueError:
                    event = {"message": line}
                self.events.put(("event", event))
        return len(text)

    def flush(self):
        if not self.log.closed:
            self.log.flush()


def run_operation(operation, low, high, allow_discharge, log_dir, events):
    """Worker entry; all events return through a queue, never through Tk."""
    log_path = log_dir / (datetime.now().strftime("%Y%m%d_%H%M%S_%f_") + operation + ".jsonl")
    try:
        if operation not in OPERATIONS:
            raise ValueError("未知操作")
        if not is_admin():
            raise PermissionError("需要管理员权限，请重新启动程序并同意 Windows 权限请求。")
        if operation == "enable":
            low, high = validate_thresholds(low, high)
        resources = resource_check()
        log_dir.mkdir(parents=True, exist_ok=True)
        with log_path.open("x", encoding="utf-8", buffering=1) as log:
            stream = EventStream(log, events)
            # A windowed EXE has no sys.stdout. Redirect explicitly before the
            # existing controller emits anything, including failure records.
            with contextlib.redirect_stdout(stream):
                try:
                    native.main([
                        operation, "--board", "BM5235", "--experimental-raw-io",
                        "--bridge", str(resources["BM5235ECBridge.exe"]),
                        *(["--enable-write"] if operation in ("enable", "disable") else []),
                        "--low", str(low), "--high", str(high), "--no-observe",
                        *(["--allow-initial-discharge"] if operation == "enable" and allow_discharge else []),
                    ])
                except Exception as error:
                    battery.emit({"error": str(error), "automatic_retry": False})
                    raise
        result = OperationResult(operation, True, log_path)
    except Exception as error:
        result = OperationResult(operation, False, log_path, str(error))
    events.put(("finished", result))


def run_lighting_operation(operation, rgb, mode, log_dir, events):
    """Same serialized UI worker model; a separate, narrow lighting backend."""
    log_path = log_dir / (datetime.now().strftime("%Y%m%d_%H%M%S_%f_") + operation + ".jsonl")
    try:
        if operation not in LIGHTING_OPERATIONS:
            raise ValueError("未知灯光操作")
        if not is_admin():
            raise PermissionError("需要管理员权限，请重新启动程序并同意 Windows 权限请求。")
        if operation == "lighting_rgb":
            rgb = lighting.validate_rgb(rgb)
        elif operation == "lighting_mode":
            mode = lighting.validate_byte(mode, "灯效模式")
        resources = resource_check()
        log_dir.mkdir(parents=True, exist_ok=True)
        with log_path.open("x", encoding="utf-8", buffering=1) as log:
            with contextlib.redirect_stdout(EventStream(log, events)):
                try:
                    lighting.execute(operation, resources["BM5235ECBridge.exe"], rgb=rgb, mode=mode)
                except Exception as error:
                    battery.emit({"error": str(error), "automatic_retry": False})
                    raise
        result = OperationResult(operation, True, log_path)
    except Exception as error:
        result = OperationResult(operation, False, log_path, str(error))
    events.put(("finished", result))


def run_cpu_operation(operation, settings, log_dir, events):
    log_path = log_dir / (datetime.now().strftime("%Y%m%d_%H%M%S_%f_") + operation + ".jsonl")
    try:
        if operation not in CPU_OPERATIONS:
            raise ValueError("未知 CPU 操作")
        if not is_admin():
            raise PermissionError("需要管理员权限，请重新启动程序并同意 Windows 权限请求。")
        if operation == "cpu_apply":
            if not isinstance(settings, dict):
                raise ValueError("请填写 CPU 参数。")
            settings = cpu_control.validate_settings(settings.get("sustained_w"), settings.get("fast_w"),
                                                       settings.get("temperature_c"))
        resources = resource_check()
        log_dir.mkdir(parents=True, exist_ok=True)
        with log_path.open("x", encoding="utf-8", buffering=1) as log:
            with contextlib.redirect_stdout(EventStream(log, events)):
                try:
                    cpu_control.execute(operation, resources["BM5235ECBridge.exe"], settings=settings)
                except Exception as error:
                    battery.emit({"error": str(error), "automatic_retry": False})
                    raise
        result = OperationResult(operation, True, log_path)
    except Exception as error:
        result = OperationResult(operation, False, log_path, str(error))
    events.put(("finished", result))


class BatteryApp:
    def __init__(self, root, log_dir=None, start_telemetry=True):
        self.root = root
        self.log_dir = log_dir or default_log_dir()
        self.events = queue.Queue()
        self.busy = False
        self.telemetry_pending = False
        self.admin = is_admin()
        self.last_log = None
        self.last_ec = None
        self.ec_seen_at = None
        self.last_lighting = None
        self.last_cpu = None
        self.low, self.high = tk.StringVar(value="60"), tk.StringVar(value="80")
        self.allow_discharge = tk.BooleanVar(value=False)
        self.soc = tk.StringVar(value="-- %")
        self.power = tk.StringVar(value="正在读取电池状态…")
        self.charge_rate = tk.StringVar(value="--")
        self.discharge_rate = tk.StringVar(value="--")
        self.rate_detail = tk.StringVar(value="正在读取充放电速率…")
        self.policy = tk.StringVar(value="尚未读取 EC")
        self.policy_detail = tk.StringVar(value="点击「读取 EC 状态」核对当前配置")
        self.rule = tk.StringVar()
        self.rgb = tuple(tk.StringVar(value="255") for _ in range(3))
        self.effect_mode = tk.StringVar(value="1")
        self.rgb_preview_text = tk.StringVar(value="#FFFFFF")
        self.lighting_status = tk.StringVar(value="尚未读取灯光设置")
        self.cpu_sustained = tk.StringVar(value="45")
        self.cpu_fast = tk.StringVar(value="65")
        self.cpu_temperature = tk.StringVar(value="90")
        self.cpu_status = tk.StringVar(value="尚未读取 CPU 设置")
        self.cpu_detail = tk.StringVar(value="输入参数后点击应用；启动程序和切换页签不会修改 CPU 设置。")
        self.cpu_range = tk.StringVar(value="持续 5–101 W · 快速 5–120 W · 温度上限 40–95 ℃；读取后按 CPU 类别核对范围。")
        self.notice = tk.StringVar(value="就绪。阈值提交并回读确认后即可关闭窗口。")
        self._build()
        self.low.trace_add("write", self._update_rule)
        self.high.trace_add("write", self._update_rule)
        for value in self.rgb:
            value.trace_add("write", self._update_color_preview)
        self._update_rule()
        self._refresh_power()
        if start_telemetry:
            self.root.after(0, self._refresh_telemetry)
        self.root.after(100, self._poll_events)
        self.root.protocol("WM_DELETE_WINDOW", self.close)

    def _build(self):
        root = self.root
        root.title(APP_NAME + " · BM5235")
        root.configure(bg=BG)
        root.geometry("880x800")
        root.minsize(790, 760)
        style = ttk.Style(root)
        style.theme_use("clam")
        style.configure("TButton", font=("Microsoft YaHei UI", 10), padding=(14, 9),
                        background="#E8EEF7", foreground=INK, borderwidth=0)
        style.map("TButton", background=[("active", "#DBE5F4"), ("disabled", "#EFF2F6")],
                  foreground=[("disabled", "#98A3B3")])
        style.configure("Primary.TButton", background=ACCENT, foreground="white")
        style.map("Primary.TButton", background=[("active", "#1D4ED8"), ("disabled", "#99B7F6")],
                  foreground=[("disabled", "white")])
        style.configure("Small.TButton", font=("Microsoft YaHei UI", 9), padding=(10, 6))
        style.configure("TSpinbox", font=("Microsoft YaHei UI", 20), padding=6)
        style.configure("Card.TCheckbutton", background=CARD, foreground=INK,
                        font=("Microsoft YaHei UI", 10))
        style.map("Card.TCheckbutton", background=[("active", CARD)])
        style.configure("Battery.Horizontal.TProgressbar", background="#22A77A", troughcolor="#E4EBF3",
                        borderwidth=0, thickness=8)
        style.configure("Work.Horizontal.TProgressbar", background=ACCENT, troughcolor=BG,
                        borderwidth=0, thickness=3)
        style.configure("TNotebook", background=BG, borderwidth=0)
        style.configure("TNotebook.Tab", font=("Microsoft YaHei UI", 11), padding=(20, 10))
        style.map("TNotebook.Tab", background=[("selected", CARD)],
                  foreground=[("selected", ACCENT)])

        # Keep controls accessible on smaller screens and with Windows display
        # scaling, where font sizes can exceed fixed pixel window dimensions.
        container = tk.Frame(root, bg=BG)
        container.pack(fill="both", expand=True)
        canvas = tk.Canvas(container, bg=BG, highlightthickness=0)
        scrollbar = ttk.Scrollbar(container, orient="vertical", command=canvas.yview)
        scrollbar.pack(side="right", fill="y")
        canvas.pack(side="left", fill="both", expand=True)
        canvas.configure(yscrollcommand=scrollbar.set)
        outer = tk.Frame(canvas, bg=BG, padx=26, pady=20)
        content_id = canvas.create_window(0, 0, window=outer, anchor="nw")
        outer.bind("<Configure>", lambda _event: canvas.configure(scrollregion=canvas.bbox("all")))
        canvas.bind("<Configure>", lambda event: canvas.itemconfigure(
            content_id, width=event.width, height=max(event.height, outer.winfo_reqheight())))
        root.bind("<MouseWheel>", lambda event: canvas.yview_scroll(-int(event.delta / 120), "units"))
        outer.columnconfigure(0, weight=1)
        outer.rowconfigure(4, weight=1)
        header = tk.Frame(outer, bg=BG)
        header.grid(row=0, column=0, sticky="ew", pady=(0, 16))
        self._label(header, "电池、灯光与 CPU 控制", 24, bold=True, bg=BG).pack(anchor="w")
        self._label(header, "蛟龙16Pro 2023 / MRID6  ·  EC 原生控制，设置完成后无需常驻", 10,
                    color=MUTED, bg=BG).pack(anchor="w", pady=(3, 0))

        status = tk.Frame(outer, bg=CARD, padx=20, pady=16)
        status.grid(row=1, column=0, sticky="ew", pady=(0, 14))
        status.columnconfigure(0, weight=1)
        status.columnconfigure(1, weight=1)
        left = tk.Frame(status, bg=CARD)
        left.grid(row=0, column=0, sticky="nsew")
        self._label(left, "当前电量", 10, color=MUTED).pack(anchor="w")
        self._label(left, size=34, bold=True, variable=self.soc).pack(anchor="w")
        self.charge_bar = ttk.Progressbar(left, maximum=100, length=235,
                                         style="Battery.Horizontal.TProgressbar")
        self.charge_bar.pack(anchor="w", pady=(3, 8))
        self._label(left, size=10, variable=self.power, color=MUTED).pack(anchor="w")
        right = tk.Frame(status, bg=CARD, padx=16)
        right.grid(row=0, column=1, sticky="nsew")
        self._label(right, "EC 配置（手动读取）", 10, color=MUTED).pack(anchor="w")
        self._label(right, size=17, bold=True, variable=self.policy).pack(anchor="w", pady=(12, 4))
        self._label(right, size=9, variable=self.policy_detail, color=MUTED,
                    wraplength=330, justify="left").pack(anchor="w")
        self.inspect_button = ttk.Button(right, text="读取 EC 状态", command=lambda: self.start("inspect"),
                                         style="Small.TButton")
        self.inspect_button.pack(anchor="w", pady=(12, 0))

        rates = tk.Frame(status, bg=CARD)
        rates.grid(row=1, column=0, columnspan=2, sticky="ew", pady=(18, 0))
        rates.columnconfigure(0, weight=1)
        rates.columnconfigure(1, weight=1)
        for column, (title, variable, color) in enumerate((
                ("充电速率", self.charge_rate, "#198260"), ("放电速率", self.discharge_rate, "#C26923"))):
            field = tk.Frame(rates, bg="#F5F8FC", padx=12, pady=8)
            field.grid(row=0, column=column, sticky="ew", padx=(0, 12) if column == 0 else 0)
            self._label(field, title, 10, color=MUTED, bg="#F5F8FC").pack(anchor="w")
            self._label(field, size=19, bold=True, variable=variable, color=color,
                        bg="#F5F8FC").pack(anchor="w", pady=(3, 0))
        self._label(status, size=9, variable=self.rate_detail, color=MUTED).grid(
            row=2, column=0, columnspan=2, sticky="w", pady=(6, 0))

        self.tabs = ttk.Notebook(outer)
        self.tabs.grid(row=2, column=0, sticky="ew", pady=(0, 12))
        battery_page = tk.Frame(self.tabs, bg=CARD)
        lighting_page = tk.Frame(self.tabs, bg=CARD)
        cpu_page = tk.Frame(self.tabs, bg=CARD)
        battery_page.columnconfigure(0, weight=1)
        lighting_page.columnconfigure(0, weight=1)
        cpu_page.columnconfigure(0, weight=1)
        self.tabs.add(battery_page, text="充电阈值")
        self.tabs.add(lighting_page, text="RGB 与灯效")
        self.tabs.add(cpu_page, text="CPU 功耗与温控")
        settings = tk.Frame(battery_page, bg=CARD, padx=20, pady=16)
        settings.grid(row=0, column=0, sticky="ew", pady=(0, 12))
        self._label(settings, "设置充电范围", 13, bold=True).pack(anchor="w")
        fields = tk.Frame(settings, bg=CARD)
        fields.pack(fill="x", pady=(12, 10))
        self.inputs = []
        for column, (title, variable, upper) in enumerate((
                ("低于此电量开始充电", self.low, 99), ("达到此电量停止充电", self.high, 100))):
            field = tk.Frame(fields, bg=CARD)
            field.grid(row=0, column=column, sticky="w", padx=(0, 44))
            self._label(field, title, 10, color=MUTED).pack(anchor="w", pady=(0, 6))
            line = tk.Frame(field, bg=CARD)
            line.pack(anchor="w")
            spin = ttk.Spinbox(line, from_=1 if column == 0 else 2, to=upper, width=5,
                               textvariable=variable, font=("Microsoft YaHei UI", 20))
            spin.pack(side="left")
            self._label(line, "%", 17, color=MUTED).pack(side="left", padx=7)
            self.inputs.append(spin)
        presets = tk.Frame(settings, bg=CARD)
        presets.pack(anchor="w", pady=(0, 8))
        self.preset_buttons = []
        for text, low, high in (("日常 60 / 80", 60, 80), ("长期插电 50 / 70", 50, 70), ("出行 40 / 95", 40, 95)):
            button = ttk.Button(presets, text=text, style="Small.TButton",
                                command=lambda lo=low, hi=high: self.set_preset(lo, hi))
            button.pack(side="left", padx=(0, 8))
            self.preset_buttons.append(button)
        self._label(settings, size=10, color=ACCENT, variable=self.rule).pack(anchor="w", pady=(2, 8))
        self.discharge_check = ttk.Checkbutton(settings, text="允许高电量初始化放电（默认关闭）",
                                               variable=self.allow_discharge, style="Card.TCheckbutton")
        self.discharge_check.pack(anchor="w")
        self._label(settings, "注意需在低负载下开启,高负载下有可能会欠电关机,开启后插电时消耗电池。默认要求当前电量低于停止阈值。", 9,
                    color=MUTED).pack(anchor="w", pady=(3, 0))

        actions = tk.Frame(battery_page, bg=CARD, padx=20)
        actions.grid(row=1, column=0, sticky="ew", pady=(0, 16))
        self.enable_button = ttk.Button(actions, text="启用充电阈值", style="Primary.TButton",
                                        command=lambda: self.start("enable"))
        self.enable_button.pack(side="left", padx=(0, 10))
        self.disable_button = ttk.Button(actions, text="恢复默认充电", command=lambda: self.start("disable"))
        self.disable_button.pack(side="left")
        self._label(actions, "管理员模式" if self.admin else "缺少管理员权限", 9,
                    color="#198260" if self.admin else MUTED, bg=CARD).pack(side="right")

        self._build_lighting(lighting_page)
        self._build_cpu(cpu_page)
        self._label(outer, size=10, variable=self.notice, bg=BG, wraplength=800,
                    justify="left").grid(row=3, column=0, sticky="ew", pady=(0, 8))
        logs = tk.Frame(outer, bg=CARD, padx=14, pady=10)
        logs.grid(row=4, column=0, sticky="nsew")
        log_header = tk.Frame(logs, bg=CARD)
        log_header.pack(fill="x", pady=(0, 6))
        self._label(log_header, "操作记录", 10, bold=True).pack(side="left")
        ttk.Button(log_header, text="打开日志文件夹", style="Small.TButton", command=self.open_logs).pack(side="right")
        self.log_view = scrolledtext.ScrolledText(logs, height=4, wrap="word", state="disabled", relief="flat",
                                                 bg="#F8FAFD", fg=MUTED, font=("Microsoft YaHei UI", 9))
        self.log_view.pack(fill="both", expand=True)
        self.progress = ttk.Progressbar(outer, mode="indeterminate", style="Work.Horizontal.TProgressbar")
        self.progress.grid(row=5, column=0, sticky="ew", pady=(10, 5))
        self._label(outer, "适用：本项目 蛟龙16Pro 2023 机型。大负载限充可能欠电关机；重新插电可能触发初始化放电。", 9,
                    color=MUTED, bg=BG, wraplength=810, justify="left").grid(row=6, column=0, sticky="w")
        self._set_busy(False)
        self._log("窗口已就绪。电量及充放电速率约每 5 秒更新；EC 配置手动读取。")
        root.update_idletasks()
        width = min(max(880, outer.winfo_reqwidth() + 20), root.winfo_screenwidth() - 80)
        height = min(outer.winfo_reqheight() + 10, root.winfo_screenheight() - 100)
        root.geometry(f"{width}x{height}")
        root.minsize(min(width, 790), min(height, 680))

    @staticmethod
    def _label(parent, text="", size=10, bold=False, color=INK, bg=CARD, variable=None, **kwargs):
        return tk.Label(parent, text=text, textvariable=variable, bg=bg, fg=color,
                        font=("Microsoft YaHei UI", size, "bold" if bold else "normal"), **kwargs)

    def _update_rule(self, *_):
        try:
            low, high = validate_thresholds(self.low.get(), self.high.get())
            self.rule.set(f"低于 {low}% 开始充电 → 达到 {high}% 停止充电，中间区间保持原状态。")
        except ValueError as error:
            self.rule.set(str(error))

    def set_preset(self, low, high):
        self.low.set(str(low))
        self.high.set(str(high))

    def _build_lighting(self, outer):
        card = tk.Frame(outer, bg=CARD, padx=20, pady=16)
        card.grid(row=0, column=0, sticky="ew", pady=(0, 4))
        card.columnconfigure(0, weight=1)
        card.columnconfigure(1, weight=1)
        self._label(card, "RGB 与灯效", 13, bold=True).grid(row=0, column=0, sticky="w")
        self._label(card, "支持 EC 00.23 / 00.28", 9, color=MUTED).grid(row=0, column=1, sticky="e")
        colors = tk.Frame(card, bg=CARD)
        colors.grid(row=1, column=0, sticky="nw", pady=(12, 8))
        self.lighting_inputs = []
        for i, (title, variable) in enumerate(zip(("R 红", "G 绿", "B 蓝"), self.rgb)):
            column = tk.Frame(colors, bg=CARD)
            column.grid(row=0, column=i, sticky="w", padx=(0, 12))
            self._label(column, title, 9, color=MUTED).pack(anchor="w")
            spin = ttk.Spinbox(column, from_=0, to=255, width=4, textvariable=variable,
                               font=("Microsoft YaHei UI", 12))
            spin.pack(anchor="w", pady=(5, 0))
            self.lighting_inputs.append(spin)
        preview = tk.Frame(colors, bg=CARD)
        preview.grid(row=1, column=0, columnspan=3, sticky="w", pady=(10, 0))
        self.color_swatch = tk.Label(preview, bg="#FFFFFF", width=4, relief="solid", bd=1)
        self.color_swatch.pack(side="left", padx=(0, 8))
        self._label(preview, size=10, variable=self.rgb_preview_text).pack(side="left", padx=(0, 10))
        choose = ttk.Button(preview, text="选择颜色…", style="Small.TButton", command=self.choose_color)
        choose.pack(side="left")
        self.color_buttons = [choose]
        presets = tk.Frame(colors, bg=CARD)
        presets.grid(row=2, column=0, columnspan=3, sticky="w", pady=(8, 0))
        for title, rgb in (("红", (255, 0, 0)), ("绿", (0, 255, 0)), ("蓝", (0, 0, 255)),
                           ("紫", (170, 0, 255)), ("白", (255, 255, 255))):
            button = ttk.Button(presets, text=title, width=3, style="Small.TButton",
                                command=lambda value=rgb: self.set_rgb(value))
            button.pack(side="left", padx=(0, 5))
            self.color_buttons.append(button)
        effects = tk.Frame(card, bg=CARD)
        effects.grid(row=1, column=1, sticky="nw", padx=(24, 0), pady=(12, 8))
        self._label(effects, "灯效模式编号（0–255）", 10, color=MUTED).pack(anchor="w")
        mode = ttk.Spinbox(effects, from_=0, to=255, width=6, textvariable=self.effect_mode,
                           font=("Microsoft YaHei UI", 12))
        mode.pack(anchor="w", pady=(6, 8))
        self.lighting_inputs.append(mode)
        row = tk.Frame(effects, bg=CARD)
        row.pack(anchor="w")
        for value in (1, 2):
            button = ttk.Button(row, text=f"模式 {value}", style="Small.TButton",
                                command=lambda value=value: self.effect_mode.set(str(value)))
            button.pack(side="left", padx=(0, 6))
            self.color_buttons.append(button)
        self._label(effects, "编号保留固件定义；其他编号的灯效名称尚未确认。", 9,
                    color=MUTED, wraplength=280, justify="left").pack(anchor="w", pady=(8, 0))
        row = tk.Frame(card, bg=CARD)
        row.grid(row=2, column=0, columnspan=2, sticky="w", pady=(3, 7))
        self.lighting_buttons = []
        for text, operation in (("读取灯光", "lighting_read"), ("应用 RGB", "lighting_rgb"),
                                 ("应用灯效", "lighting_mode")):
            button = ttk.Button(row, text=text, style="Small.TButton",
                                command=lambda op=operation: self.start_lighting(op))
            button.pack(side="left", padx=(0, 8))
            self.lighting_buttons.append(button)
        self._label(card, size=9, variable=self.lighting_status, color=MUTED,
                    wraplength=720, justify="left").grid(row=3, column=0, columnspan=2, sticky="w")
        self._label(card, "颜色预览和模式选择仅修改输入，点击对应的「应用」按钮后生效。", 9,
                    color=MUTED).grid(row=4, column=0, columnspan=2, sticky="w", pady=(4, 0))

    def _update_color_preview(self, *_):
        try:
            rgb = lighting.validate_rgb([v.get() for v in self.rgb])
            color = "#" + "".join(f"{v:02X}" for v in rgb)
            self.color_swatch.configure(bg=color)
            self.rgb_preview_text.set(color)
        except ValueError:
            self.rgb_preview_text.set("请输入 0–255")

    def set_rgb(self, rgb):
        if self.busy:
            return
        for variable, value in zip(self.rgb, lighting.validate_rgb(rgb)):
            variable.set(str(value))

    def choose_color(self):
        if self.busy:
            return
        try:
            rgb = lighting.validate_rgb([v.get() for v in self.rgb])
            initial = "#" + "".join(f"{v:02X}" for v in rgb)
        except ValueError:
            initial = "#FFFFFF"
        _rgb, color = colorchooser.askcolor(color=initial, parent=self.root, title="选择 RGB 颜色")
        if color:
            self.set_rgb(tuple(int(color[i:i+2], 16) for i in (1, 3, 5)))

    def start_lighting(self, operation):
        if self.busy or operation not in LIGHTING_OPERATIONS:
            return
        if not self.admin:
            self.notice.set("需要管理员权限，请重新启动程序并同意 Windows 权限请求。")
            return
        rgb, mode = None, None
        try:
            if operation == "lighting_rgb":
                rgb = lighting.validate_rgb([v.get() for v in self.rgb])
            elif operation == "lighting_mode":
                mode = lighting.validate_byte(self.effect_mode.get(), "灯效模式")
        except ValueError as error:
            self.notice.set(str(error))
            return
        self._set_busy(True)
        self.notice.set(LIGHTING_OPERATIONS[operation] + "，正在读取并核对…")
        self._log(LIGHTING_OPERATIONS[operation])
        threading.Thread(target=run_lighting_operation, args=(operation, rgb, mode, self.log_dir, self.events),
                         name="ec-lighting-operation", daemon=False).start()

    def _show_lighting(self, data, operation):
        self.last_lighting = data
        version = ".".join(f"{v:02X}" for v in data.get("version", []))
        version_text = f"EC {version} · " if version else ""
        self.lighting_status.set(version_text + f"已回读：模式 {data['mode']} · {data['hex']} · "
                                 + datetime.now().strftime("%H:%M:%S"))
        if operation == "lighting_read":
            # A deliberate read loads both controls. Applying one setting
            # must not discard an unsaved edit in the other control.
            self.effect_mode.set(str(data["mode"]))
            for variable, value in zip(self.rgb, data["rgb"]):
                variable.set(str(value))

    def _refresh_power(self):
        try:
            status = battery.windows_status()
            present, soc, ac = status["battery_present"], status["soc"], status["ac"]
            self.soc.set("无电池" if present is False else f"{soc}%" if soc is not None else "-- %")
            self.charge_bar["value"] = soc if present is not False and soc is not None else 0
            supply = {True: "已接通电源", False: "使用电池", None: "电源状态未知"}[ac]
            charge = {True: "正在充电", False: "未充电", None: "充电状态未知"}[status["charging"]]
            self.power.set(supply + " · " + charge)
        except Exception as error:
            self.power.set("电池状态读取失败：" + str(error))
        self.root.after(5000, self._refresh_power)

    def _build_cpu(self, page):
        card = tk.Frame(page, bg=CARD, padx=20, pady=16)
        card.grid(row=0, column=0, sticky="ew", pady=(0, 4))
        card.columnconfigure(0, weight=1)
        self._label(card, "CPU 自定义功耗与温控", 13, bold=True).grid(row=0, column=0, sticky="w")
        self._label(card, "支持 EC 00.23 / 00.28 · 原厂 ACPI / SMU 接口", 9,
                    color=MUTED).grid(row=1, column=0, sticky="w", pady=(5, 0))
        fields = tk.Frame(card, bg=CARD)
        fields.grid(row=2, column=0, sticky="ew", pady=(14, 10))
        self.cpu_inputs = []
        for i, (title, variable, minimum, maximum, unit) in enumerate((
                ("持续功耗", self.cpu_sustained, 5, 101, "W"),
                ("快速功耗（短时）", self.cpu_fast, 5, 120, "W"),
                ("温度上限", self.cpu_temperature, 40, 95, "℃"))):
            fields.columnconfigure(i, weight=1)
            field = tk.Frame(fields, bg=CARD)
            field.grid(row=0, column=i, sticky="w", padx=(0, 16))
            self._label(field, title, 10, color=MUTED).pack(anchor="w")
            line = tk.Frame(field, bg=CARD)
            line.pack(anchor="w", pady=(7, 0))
            spin = ttk.Spinbox(line, from_=minimum, to=maximum, width=5,
                               textvariable=variable, font=("Microsoft YaHei UI", 18))
            spin.pack(side="left")
            self._label(line, unit, 12, color=MUTED).pack(side="left", padx=(6, 0))
            self.cpu_inputs.append(spin)
        self._label(card, size=9, variable=self.cpu_range, color=MUTED,
                    wraplength=720, justify="left").grid(row=3, column=0, sticky="w")
        self._label(card, "启用自定义模式需插电，且适配器额定功率大于 200 W。", 10,
                    color=MUTED).grid(row=4, column=0, sticky="w", pady=(8, 8))
        buttons = tk.Frame(card, bg=CARD)
        buttons.grid(row=5, column=0, sticky="w", pady=(3, 8))
        self.cpu_buttons = []
        for title, operation in (("读取 CPU 设置", "cpu_read"), ("应用并启用自定义", "cpu_apply"),
                                  ("退出自定义 / 恢复原厂", "cpu_restore")):
            button = ttk.Button(buttons, text=title, style="Small.TButton",
                                command=lambda op=operation: self.start_cpu(op))
            button.pack(side="left", padx=(0, 8))
            self.cpu_buttons.append(button)
        self._label(card, size=10, variable=self.cpu_status, color=ACCENT, wraplength=720,
                    justify="left").grid(row=6, column=0, sticky="w", pady=(2, 4))
        self._label(card, size=9, variable=self.cpu_detail, color=MUTED, wraplength=720,
                    justify="left").grid(row=7, column=0, sticky="w")
        self._label(card, "这里显示设置值；实际功耗随负载变化，固件也可能进一步限值。", 9,
                    color=MUTED).grid(row=8, column=0, sticky="w", pady=(5, 0))

    def start_cpu(self, operation):
        if self.busy or operation not in CPU_OPERATIONS:
            return
        if not self.admin:
            self.cpu_status.set("需要管理员权限，请重新启动程序并同意 Windows 权限请求。")
            return
        settings = None
        if operation == "cpu_apply":
            try:
                settings = cpu_control.validate_settings(
                    self.cpu_sustained.get(), self.cpu_fast.get(), self.cpu_temperature.get(),
                    self.last_cpu.get("cpu_type") if self.last_cpu else None)
            except ValueError as error:
                self.cpu_status.set(str(error))
                return
        self._set_busy(True)
        self.cpu_status.set(CPU_OPERATIONS[operation] + "，正在通过原厂接口核对…")
        self.notice.set(CPU_OPERATIONS[operation] + "，请等待操作完成。")
        self._log(CPU_OPERATIONS[operation])
        threading.Thread(target=run_cpu_operation, args=(operation, settings, self.log_dir, self.events),
                         name="oem-cpu-operation", daemon=False).start()

    def _show_cpu(self, data, operation):
        self.last_cpu = data
        maximum = cpu_control.CPU_MAX_SUSTAINED.get(data["cpu_type"], cpu_control.MAX_SUSTAINED)
        self.cpu_inputs[0].configure(to=maximum)
        self.cpu_range.set(f"持续 5–{maximum} W · 快速 5–120 W · 温度上限 40–95 ℃。")
        version = ".".join(f"{v:02X}" for v in data["version"])
        mode = "自定义已启用" if data["custom_enabled"] else "自定义未启用"
        self.cpu_status.set(f"{mode} · 适配器 {data['adapter_w']} W · EC {version}")
        if data["custom_enabled"]:
            self.cpu_detail.set(f"请求设置：持续 {data['sustained_w']} W / 快速 {data['fast_w']} W / "
                                f"温度上限 {data['temperature_c']} ℃ · 已回读原厂接口状态。")
        else:
            self.cpu_detail.set("自定义模式未启用；输入框用于下一次自定义设置。")
        if operation == "cpu_read":
            try:
                settings = cpu_control.validate_settings(data["sustained_w"], data["fast_w"],
                                                         data["temperature_c"], data["cpu_type"])
            except ValueError:
                return  # Empty/uninitialized custom caches are not usable defaults.
            self.cpu_sustained.set(str(settings["sustained_w"]))
            self.cpu_fast.set(str(settings["fast_w"]))
            self.cpu_temperature.set(str(settings["temperature_c"]))

    def _refresh_telemetry(self):
        self.root.after(5000, self._refresh_telemetry)
        if self.telemetry_pending:
            return
        self.telemetry_pending = True

        def sample():
            try:
                data = telemetry.sample()
            except Exception as error:
                data = {"available": False, "error": str(error), "batteries": []}
            self.events.put(("telemetry", data))
        threading.Thread(target=sample, name="battery-rate-query", daemon=True).start()

    def _show_rates(self, data):
        charge, discharge, hint = format_rates(data)
        self.charge_rate.set(charge)
        self.discharge_rate.set(discharge)
        self.rate_detail.set(hint + " · 更新于 " + datetime.now().strftime("%H:%M:%S"))

    def _set_busy(self, busy):
        self.busy = busy
        state = "disabled" if busy else "normal"
        for widget in [*self.inputs, *self.preset_buttons, self.discharge_check,
                       *self.lighting_inputs, *self.color_buttons, *self.cpu_inputs]:
            widget.configure(state=state)
        for button in (self.enable_button, self.disable_button, self.inspect_button, *self.lighting_buttons, *self.cpu_buttons):
            button.configure(state="normal" if self.admin and not busy else "disabled")
        if busy:
            self.progress.start(12)
        else:
            self.progress.stop()
            self.progress["value"] = 0

    def start(self, operation):
        if self.busy:
            return
        if not self.admin:
            self.notice.set("需要管理员权限，请重新启动程序并同意 Windows 权限请求。")
            return
        if operation not in OPERATIONS:
            return
        # Disabling and inspecting must remain available even if the input
        # fields are incomplete or contain a typo.
        low, high = 60, 80
        if operation == "enable":
            try:
                low, high = validate_thresholds(self.low.get(), self.high.get())
                status = battery.windows_status()
                if status["ac"] is not True or status["battery_present"] is not True:
                    raise ValueError("启用前请确认电池存在，并接通电源适配器。")
                if status["soc"] is None:
                    raise ValueError("当前电量未知，暂时无法启用。")
                if not self.allow_discharge.get() and status["soc"] >= high:
                    # Let the backend reuse a settled identical configuration;
                    # it performs the authoritative high-SOC check before writes.
                    self._log(f"当前电量 ≥ {high}%；仅允许复用已稳定的相同配置，否则后端将拒绝启用。")
            except ValueError as error:
                self.notice.set(str(error))
                return
            except Exception as error:
                self.notice.set(friendly_error(error))
                return
        self._set_busy(True)
        self.notice.set(OPERATIONS[operation] + "，正在提交并核对…")
        self._log(OPERATIONS[operation] + (f"：{low}% / {high}%" if operation == "enable" else ""))
        threading.Thread(target=run_operation, args=(operation, low, high, self.allow_discharge.get(),
                         self.log_dir, self.events), name="native-battery-operation", daemon=False).start()

    def _show_ec(self, ec):
        self.last_ec = ec
        self.ec_seen_at = datetime.now().strftime("%H:%M:%S")
        mode = ec.get("mode")
        version = ".".join(f"{part:02X}" for part in ec.get("version", []))
        if mode == native.NATIVE_MODE:
            low, high = ec.get("native_low"), ec.get("native_high")
            self.policy.set(f"原生限充  {low}% / {high}%")
            substate = {1: "初始化中（可能放电）", 2: "停充保持", 3: "允许充电"}.get(
                ec.get("native_substate"), "子状态未知")
            detail = f"{substate} · EC {version}"
        else:
            self.policy.set({0: "默认充电策略", 2: "旧版停充模式"}.get(mode, f"未知模式 {mode}"))
            detail = f"EC {version}"
        self.policy_detail.set(f"{detail}\n最后读取 {self.ec_seen_at}，当前显示为最近快照")

    def _handle_event(self, event):
        if event.get("phase") == "cpu_complete":
            self._show_cpu(event["cpu"], event["cpu_operation"])
            self._log({"cpu_read": "CPU 当前设置已读取。", "cpu_apply": "CPU 原厂接口和请求设置已核对。",
                       "cpu_restore": "CPU 已退出自定义并恢复原厂档位。"}[event["cpu_operation"]])
            return
        if event.get("phase") == "lighting_complete":
            self._show_lighting(event["lighting"], event["lighting_operation"])
            self._log("灯光设置已回读：" + event["lighting"]["hex"] + f"，模式 {event['lighting']['mode']}。")
            return
        if "ec" in event:
            self._show_ec(event["ec"])
        if "battery_telemetry" in event:
            self._show_rates(event["battery_telemetry"])
        phase = event.get("phase")
        if "error" in event:
            self._log("错误：" + str(event["error"]))
        elif phase == "complete":
            self._log("配置已提交并回读确认，EC 将自行控制充电。" if event.get("native_enabled") else "已恢复默认充电。")
        elif phase in PHASES:
            message = PHASES[phase]
            self._log(message)
        elif event.get("message"):
            self._log(event["message"])

    def _finish(self, result):
        self._set_busy(False)
        self.last_log = result.log_path if result.log_path.is_file() else None
        if result.success:
            messages = {"inspect": "EC 状态已读取。", "enable": "阈值已提交并回读确认。EC 自行控制充电，现在可以关闭窗口。",
                        "disable": "已恢复默认充电策略。", "lighting_read": "灯光设置已读取并填入界面。",
                        "lighting_rgb": "RGB 颜色已提交并回读确认。", "lighting_mode": "灯效模式已提交并回读确认。",
                        "cpu_read": "CPU 设置已读取。", "cpu_apply": "CPU 自定义参数已通过原厂接口提交并回读确认。",
                        "cpu_restore": "CPU 已退出自定义并恢复原厂档位。"}
            self.notice.set(messages[result.operation])
        else:
            # A snapshot from before a failed command cannot prove current mode.
            if result.operation in CPU_OPERATIONS:
                self.last_cpu = None
                self.cpu_status.set(friendly_error(result.error))
                self.cpu_detail.set("请先读取当前状态，再决定是否恢复原厂档位。")
            elif result.operation in LIGHTING_OPERATIONS:
                self.last_lighting = None
                # Keep the reason beside the buttons, even when the global
                # notice below this tab is outside the visible scroll area.
                self.lighting_status.set(friendly_error(result.error) + " 请重新读取灯光设置。")
            else:
                self.policy.set("状态需要重新读取")
                self.policy_detail.set("操作未完成；点击「读取 EC 状态」核对配置")
            self.notice.set(friendly_error(result.error))
            self._log("操作未完成：" + result.error)
        if self.last_log:
            self._log("完整日志：" + str(self.last_log))

    def _poll_events(self):
        try:
            while True:
                kind, value = self.events.get_nowait()
                if kind == "event":
                    self._handle_event(value)
                elif kind == "finished":
                    self._finish(value)
                elif kind == "telemetry":
                    self.telemetry_pending = False
                    self._show_rates(value)
        except queue.Empty:
            pass
        self.root.after(100, self._poll_events)

    def _log(self, text):
        self.log_view.configure(state="normal")
        self.log_view.insert("end", datetime.now().strftime("%H:%M:%S  ") + text + "\n")
        if int(self.log_view.index("end-1c").split(".")[0]) > 400:
            self.log_view.delete("1.0", "100.0")
        self.log_view.see("end")
        self.log_view.configure(state="disabled")

    def open_logs(self):
        try:
            self.log_dir.mkdir(parents=True, exist_ok=True)
            os.startfile(self.log_dir)
        except OSError as error:
            self.notice.set("无法打开日志文件夹：" + str(error))

    def close(self):
        if self.busy:
            self.notice.set("正在与 EC 通信，请等操作完成后再关闭窗口。")
            return
        self.root.destroy()


def check_package(report_path):
    """Exercise the frozen runtime and UI without loading the EC driver."""
    resources = resource_check()
    report = {"frozen": bool(getattr(sys, "frozen", False)), "resources": {}, "ec_accessed": False}
    import hashlib
    for name, path in resources.items():
        report["resources"][name] = hashlib.sha256(path.read_bytes()).hexdigest()
    # The bridge's default invocation only calls GetSystemPowerStatus; it
    # deliberately does not initialize WinRing0 (unlike --inspect / --serve).
    bridge = subprocess.run([str(resources["BM5235ECBridge.exe"])], capture_output=True,
                            encoding="utf-8-sig", timeout=15, creationflags=subprocess.CREATE_NO_WINDOW)
    if bridge.returncode:
        raise RuntimeError(bridge.stderr or bridge.stdout)
    report["bridge_status"] = json.loads(bridge.stdout)
    root = tk.Tk()
    try:
        app = BatteryApp(root, log_dir=report_path.parent / "logs", start_telemetry=False)
        rate_data = telemetry.sample()
        app._show_rates(rate_data)
        root.update()
        report["windows_status"] = battery.windows_status()
        report["window_title"] = root.title()
        report["tk_version"] = root.tk.call("info", "patchlevel")
        report["window_size"] = [root.winfo_width(), root.winfo_height()]
        report["admin"] = app.admin
        report["main_action_state"] = str(app.enable_button["state"])
        report["telemetry"] = rate_data
        report["displayed_rates"] = [app.charge_rate.get(), app.discharge_rate.get()]
        report["cpu_ui_ready"] = len(app.cpu_buttons) == 3 and len(app.tabs.tabs()) == 3
        report["cpu_default_inputs"] = [app.cpu_sustained.get(), app.cpu_fast.get(), app.cpu_temperature.get()]
        report["cpu_wmi_invoked"] = False
        report["ui_ready"] = True
        report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    finally:
        root.destroy()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check-package", type=Path, help="Write a no-EC runtime/UI check report and exit")
    args = parser.parse_args()
    if os.name != "nt":
        parser.error("此程序需要 Windows。")
    try:
        ctypes.windll.shcore.SetProcessDpiAwareness(1)
    except (AttributeError, OSError):
        pass
    if args.check_package:
        try:
            check_package(args.check_package)
        except Exception as error:
            args.check_package.write_text(json.dumps({"ui_ready": False, "error": str(error)},
                                                     ensure_ascii=False, indent=2), encoding="utf-8")
            raise
        return
    if not is_admin():
        launch_as_admin()
        return
    root = tk.Tk()
    app = BatteryApp(root)

    def callback_error(_kind, value, _traceback):
        app.notice.set("界面操作出错：" + str(value))
        app._log("界面错误：" + str(value))
    root.report_callback_exception = callback_error
    root.mainloop()


if __name__ == "__main__":
    main()
