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
from tkinter import scrolledtext, ttk

import bm5235_battery as battery
import bm5235_native as native
import battery_telemetry as telemetry


APP_NAME = "蛟龙16Pro电池充电阈值"
RESOURCE_DIR = Path(__file__).resolve().parent
RESOURCE_FILES = ("BM5235ECBridge.exe", "WinRing0x64.dll", "WinRing0x64.sys")
OPERATIONS = {"inspect": "读取 EC 状态", "enable": "启用充电阈值", "disable": "恢复默认充电"}
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
        self.notice = tk.StringVar(value="就绪。阈值提交并回读确认后即可关闭窗口。")
        self._build()
        self.low.trace_add("write", self._update_rule)
        self.high.trace_add("write", self._update_rule)
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
        outer.rowconfigure(5, weight=1)
        header = tk.Frame(outer, bg=BG)
        header.grid(row=0, column=0, sticky="ew", pady=(0, 16))
        self._label(header, "电池充电阈值", 24, bold=True, bg=BG).pack(anchor="w")
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

        settings = tk.Frame(outer, bg=CARD, padx=20, pady=16)
        settings.grid(row=2, column=0, sticky="ew", pady=(0, 12))
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

        actions = tk.Frame(outer, bg=BG)
        actions.grid(row=3, column=0, sticky="ew", pady=(0, 10))
        self.enable_button = ttk.Button(actions, text="启用充电阈值", style="Primary.TButton",
                                        command=lambda: self.start("enable"))
        self.enable_button.pack(side="left", padx=(0, 10))
        self.disable_button = ttk.Button(actions, text="恢复默认充电", command=lambda: self.start("disable"))
        self.disable_button.pack(side="left")
        self._label(actions, "管理员模式" if self.admin else "缺少管理员权限", 9,
                    color="#198260" if self.admin else MUTED, bg=BG).pack(side="right")

        self._label(outer, size=10, variable=self.notice, bg=BG, wraplength=800,
                    justify="left").grid(row=4, column=0, sticky="ew", pady=(0, 8))
        logs = tk.Frame(outer, bg=CARD, padx=14, pady=10)
        logs.grid(row=5, column=0, sticky="nsew")
        log_header = tk.Frame(logs, bg=CARD)
        log_header.pack(fill="x", pady=(0, 6))
        self._label(log_header, "操作记录", 10, bold=True).pack(side="left")
        ttk.Button(log_header, text="打开日志文件夹", style="Small.TButton", command=self.open_logs).pack(side="right")
        self.log_view = scrolledtext.ScrolledText(logs, height=4, wrap="word", state="disabled", relief="flat",
                                                 bg="#F8FAFD", fg=MUTED, font=("Microsoft YaHei UI", 9))
        self.log_view.pack(fill="both", expand=True)
        self.progress = ttk.Progressbar(outer, mode="indeterminate", style="Work.Horizontal.TProgressbar")
        self.progress.grid(row=6, column=0, sticky="ew", pady=(10, 5))
        self._label(outer, "适用：本项目 蛟龙16Pro 2023 机型。大负载限充可能欠电关机；重新插电可能触发初始化放电。", 9,
                    color=MUTED, bg=BG, wraplength=810, justify="left").grid(row=7, column=0, sticky="w")
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
        for widget in [*self.inputs, *self.preset_buttons, self.discharge_check]:
            widget.configure(state=state)
        for button in (self.enable_button, self.disable_button, self.inspect_button):
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
                        "disable": "已恢复默认充电策略。"}
            self.notice.set(messages[result.operation])
        else:
            # A snapshot from before a failed command cannot prove current mode.
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
