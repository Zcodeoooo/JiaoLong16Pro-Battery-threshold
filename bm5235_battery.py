"""BM5235 / MRID6 EC 00.28 battery-control RESEARCH PROTOTYPE.

Default: Windows battery status only. No driver is loaded without an explicit
raw-I/O option. Read README.md before using inspect / stop / resume / control.
Raw port access is NOT synchronized with Windows ACPIEC; this is not a service.
Only standard-library Python modules are required. The Windows helper uses
the user's existing DLL/SYS, copied unchanged beside its EXE.
"""
import argparse
import ctypes as ct
from ctypes import wintypes as wt
import datetime as dt
import json
import os
from pathlib import Path
import queue
import subprocess
import sys
import threading
import time

EXPECTED_VERSION = (0x00, 0x28, 0x00, 0x00)
READ_ADDRESSES = set(range(0x8410, 0x8414)) | {
    0x8150, 0x8151, 0x8152, 0x83C0, 0x8370, 0x8394, 0x8395,
    0x83A0, 0x83A1, 0x83A2, 0x837C, 0x837D, 0x8460, 0x847C,
}


def emit(data):
    print(json.dumps({"time": dt.datetime.now().astimezone().isoformat(),
                      **data}, ensure_ascii=False), flush=True)


def windows_status():
    if os.name != "nt":
        raise RuntimeError("Windows is required for live status.")

    class PowerStatus(ct.Structure):
        _fields_ = [("ac", wt.BYTE), ("flags", wt.BYTE), ("soc", wt.BYTE),
                    ("saver", wt.BYTE), ("life", wt.DWORD), ("full", wt.DWORD)]

    fn = ct.WinDLL("kernel32", use_last_error=True).GetSystemPowerStatus
    fn.argtypes, fn.restype = [ct.POINTER(PowerStatus)], wt.BOOL
    status = PowerStatus()
    if not fn(ct.byref(status)):
        raise ct.WinError(ct.get_last_error())
    return {"ac": {0: False, 1: True}.get(status.ac),
            "soc": status.soc if status.soc <= 100 else None,
            "battery_present": None if status.flags == 255 else not bool(status.flags & 128),
            "charging": None if status.flags == 255 else bool(status.flags & 8)}


def hysteresis(soc, stopped, low=60, high=80):
    """Strictly below low resumes; high inclusive stops; preserve in between."""
    if not 0 <= soc <= 100 or not 0 < low < high <= 100:
        raise ValueError("Invalid SOC or thresholds")
    return True if soc >= high else False if soc < low else stopped


class SingleInstance:
    """Serializes our processes only. Does NOT acquire Windows ACPIEC's lock."""
    def __enter__(self):
        self.k = ct.WinDLL("kernel32", use_last_error=True)
        self.k.CreateMutexW.argtypes = [ct.c_void_p, wt.BOOL, wt.LPCWSTR]
        self.k.CreateMutexW.restype = wt.HANDLE
        self.k.CloseHandle.argtypes, self.k.CloseHandle.restype = [wt.HANDLE], wt.BOOL
        self.k.ReleaseMutex.argtypes, self.k.ReleaseMutex.restype = [wt.HANDLE], wt.BOOL
        self.handle = self.k.CreateMutexW(None, True, r"Global\BM5235BatteryPrototype")
        error = ct.get_last_error()
        if not self.handle:
            raise ct.WinError(error)
        if error == 183:
            self.k.CloseHandle(self.handle)
            raise RuntimeError("Another prototype process exists; no EC transaction was started.")
        return self

    def __exit__(self, *_):
        self.k.ReleaseMutex(self.handle)
        self.k.CloseHandle(self.handle)


class WinRingPorts:
    """Optional DLL ABI backend. It does not download or bypass driver policy."""
    def __init__(self, path):
        path = Path(path).resolve(strict=True)
        self.dll = ct.WinDLL(str(path), use_last_error=True)
        self.dll.InitializeOls.argtypes, self.dll.InitializeOls.restype = [], wt.BOOL
        self.dll.GetDllStatus.argtypes, self.dll.GetDllStatus.restype = [], wt.DWORD
        self.dll.DeinitializeOls.argtypes, self.dll.DeinitializeOls.restype = [], None
        self.dll.ReadIoPortByteEx.argtypes = [wt.WORD, ct.POINTER(wt.BYTE)]
        self.dll.ReadIoPortByteEx.restype = wt.BOOL
        self.dll.WriteIoPortByteEx.argtypes = [wt.WORD, wt.BYTE]
        self.dll.WriteIoPortByteEx.restype = wt.BOOL
        initialized = self.dll.InitializeOls()
        status = self.dll.GetDllStatus()
        if not initialized or status != 0:
            if initialized:
                self.dll.DeinitializeOls()
            raise RuntimeError(f"I/O driver unavailable: DLL status {status}. No security bypass is provided.")

    def read(self, port):
        if port not in (0x62, 0x66):
            raise ValueError("Port outside this profile")
        value = wt.BYTE()
        if not self.dll.ReadIoPortByteEx(port, ct.byref(value)):
            raise RuntimeError("I/O port read failed")
        return value.value

    def write(self, port, value):
        if port not in (0x62, 0x66) or not 0 <= value <= 255:
            raise ValueError("Invalid port write")
        if not self.dll.WriteIoPortByteEx(port, value):
            raise RuntimeError("I/O port write failed")

    def close(self):
        self.dll.DeinitializeOls()


class NativeBridgePorts:
    """Run the provided EXE beside DLL/SYS; inherit the caller's privileges.

    It never elevates itself. This avoids legacy DLL searches relative to the
    Python interpreter EXE. Stdio is private to this child process.
    """
    def __init__(self, path, allow_writes=False):
        executable = Path(path).resolve(strict=True)
        args = [str(executable), "--serve", "--experimental-raw-io"]
        if allow_writes:
            args.append("--allow-ec-write")
        self.process = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                        stderr=subprocess.DEVNULL, encoding="utf-8", bufsize=1,
                                        creationflags=subprocess.CREATE_NO_WINDOW)
        self.responses = queue.Queue()
        def read_output():
            try:
                for line in self.process.stdout:
                    self.responses.put(line.strip())
            finally:
                self.responses.put(None)
        self.reader = threading.Thread(target=read_output, daemon=True)
        self.reader.start()
        try:
            ready = self.response(timeout=10)
            if ready != "READY":
                raise RuntimeError("Native bridge did not become ready: " + str(ready))
        except Exception:
            self.close()
            raise

    def response(self, timeout=2):
        try:
            reply = self.responses.get(timeout=timeout)
        except queue.Empty:
            raise TimeoutError("Native I/O bridge timeout; no automatic retry")
        if reply is None:
            raise RuntimeError("Native I/O bridge exited")
        if reply.startswith("ERR "):
            raise RuntimeError(reply[4:])
        return reply

    def request(self, text):
        self.process.stdin.write(text + "\n")
        self.process.stdin.flush()
        return self.response()

    def read(self, port):
        if port not in (0x62, 0x66):
            raise ValueError("Port outside this profile")
        reply = self.request(f"R {port:04X}")
        if not reply.startswith("V "):
            raise RuntimeError("Invalid native bridge read response")
        return int(reply[2:], 16)

    def write(self, port, value):
        if port not in (0x62, 0x66) or not 0 <= value <= 255:
            raise ValueError("Invalid port write")
        if self.request(f"W {port:04X} {value:02X}") != "OK":
            raise RuntimeError("Invalid native bridge write response")

    def close(self):
        if self.process.poll() is None:
            try:
                self.process.stdin.write("QUIT\n")
                self.process.stdin.flush()
                self.process.wait(timeout=2)
            except (OSError, subprocess.TimeoutExpired):
                self.process.terminate()
                self.process.wait(timeout=2)
        self.process.stdin.close()
        self.process.stdout.close()


class EC:
    """Firmware-specific 0x92 read / 0x93 write, address HIGH byte first.

    All reads send commands to the command port but do not write EC RAM.
    Any incomplete transaction poisons this object: do not flush or retry.
    """
    def __init__(self, ports, timeout=0.25):
        self.ports, self.timeout, self.poisoned = ports, timeout, False

    def wait(self, mask, expected):
        until = time.monotonic() + self.timeout
        while True:
            status = self.ports.read(0x66)
            if status == 0xFF:
                raise RuntimeError("EC status is 0xFF: controller/transport unavailable")
            if status & mask == expected:
                return
            if time.monotonic() >= until:
                raise TimeoutError("EC port timeout; transaction state is uncertain")
            time.sleep(0.0005)

    def transact(self, command, data, output=False):
        if self.poisoned:
            raise RuntimeError("Previous transaction failed; further EC I/O is disabled")
        try:
            # Do not consume another client's output or pending SCI notification.
            status = self.ports.read(0x66)
            if status == 0xFF or status & 0x23:
                raise RuntimeError(f"EC busy or SCI pending (0x{status:02X}); no command submitted")
            self.ports.write(0x66, command)
            for value in data:
                self.wait(2, 0)
                self.ports.write(0x62, value)
            self.wait(2, 0)
            if output:
                self.wait(1, 1)
                return self.ports.read(0x62)
            # 0x93 has no response byte. A later read checks its effect.
        except BaseException:
            self.poisoned = True
            raise

    def read(self, address):
        if address not in READ_ADDRESSES:
            raise ValueError("Read outside the analyzed profile")
        return self.transact(0x92, (address >> 8, address & 255), True)

    def mailbox_write(self, address, value):
        if (address, value) not in {(0x8151, 0x0E), (0x8151, 0x0F), (0x8150, 0x10)}:
            raise ValueError("Only analyzed stop/resume mailbox writes are allowed")
        self.transact(0x93, (address >> 8, address & 255, value))

    def snapshot(self):
        data = {address: self.read(address) for address in sorted(READ_ADDRESSES)}
        flags = data[0x8460]
        return {"version": [data[a] for a in range(0x8410, 0x8414)],
                "soc": data[0x847C], "ac": bool(flags & 1),
                "battery_present": bool(flags & 2), "charging": bool(flags & 4),
                "discharging": bool(flags & 8), "mode": data[0x83C0],
                "state": data[0x8370], "mailbox_command": data[0x8150],
                "mailbox_result": data[0x8152],
                # Firmware requested-current buffer, NOT a measured battery current.
                "requested_current_zero": data[0x837C] == data[0x837D] == 0,
                "raw": {f"{a:04X}": f"{v:02X}" for a, v in data.items()}}


def validate(ec_status, os_status, require_ac=True, allowed_modes=(0, 2)):
    if tuple(ec_status["version"]) != EXPECTED_VERSION:
        raise RuntimeError("EC version differs from analyzed 00.28.00.00; refusing writes")
    if ec_status["mode"] not in allowed_modes:
        raise RuntimeError("Another/unknown battery mode is active; refusing writes")
    if ec_status["mailbox_command"] != 0:
        raise RuntimeError("Firmware mailbox is busy; refusing writes")
    if not ec_status["battery_present"] or os_status["battery_present"] is not True:
        raise RuntimeError("Battery presence is unknown/inconsistent; refusing writes")
    if os_status["ac"] is None or os_status["soc"] is None or not 0 <= ec_status["soc"] <= 100:
        raise RuntimeError("Power/SOC reading unknown; refusing writes")
    if ec_status["ac"] != os_status["ac"] or abs(ec_status["soc"] - os_status["soc"]) > 5:
        raise RuntimeError("EC and Windows readings disagree; refusing writes")
    if require_ac and not ec_status["ac"]:
        raise RuntimeError("Connect AC for this command")


def set_stopped(ec, stopped, require_ac=True):
    before = ec.snapshot()
    validate(before, windows_status(), require_ac)
    if bool(before["mode"] & 2) == stopped:
        return before
    # Mailbox subcommand first, trigger last. Do not write completion or flags directly.
    if ec.read(0x8150) != 0 or ec.read(0x83C0) != before["mode"]:
        raise RuntimeError("EC mode/mailbox changed before submission")
    ec.mailbox_write(0x8151, 0x0E if stopped else 0x0F)
    ec.mailbox_write(0x8150, 0x10)
    deadline = time.monotonic() + 3
    while ec.read(0x8150) != 0:
        if time.monotonic() >= deadline:
            ec.poisoned = True
            raise TimeoutError("Mailbox timeout; no retry or cleanup write will be attempted")
        time.sleep(0.02)
    if ec.read(0x8152) != 0x55 or ec.read(0x83C0) != (2 if stopped else 0):
        ec.poisoned = True
        raise RuntimeError("Mailbox result/flag mismatch; live state is uncertain")
    return ec.snapshot()


def run_control(ec, args):
    initial = ec.snapshot()
    validate(initial, windows_status())
    if initial["mode"] == 2 and not args.take_over_stop:
        raise RuntimeError("Stop flag already set. Resolve its owner or explicitly use --take-over-stop.")
    desired = bool(initial["mode"])
    start = time.monotonic()
    normal_exit = False
    try:
        while True:
            os_status, snapshot = windows_status(), ec.snapshot()
            validate(snapshot, os_status, require_ac=False)
            if snapshot["ac"]:
                desired = hysteresis(snapshot["soc"], desired, args.low, args.high)
                if desired != bool(snapshot["mode"] & 2):
                    snapshot = set_stopped(ec, desired)
                if desired and snapshot["discharging"]:
                    raise RuntimeError("EC reports discharge while stopped on AC; end the experiment and inspect supply behavior")
            emit({"operation": "control", "desired_stop": desired,
                  "windows": os_status, "ec": snapshot})
            if args.duration and time.monotonic() - start >= args.duration:
                normal_exit = True
                break
            time.sleep(args.interval)
    except KeyboardInterrupt:
        normal_exit = True
    finally:
        # Restore only on a deliberate normal exit, with a healthy transport.
        # Failures never trigger an uncertain second raw-I/O sequence.
        if normal_exit and not ec.poisoned and not args.leave_stop:
            restored = set_stopped(ec, bool(initial["mode"]), require_ac=False)
            emit({"operation": "restore_initial_policy", "ec": restored})
        elif ec.poisoned or not normal_exit or args.leave_stop:
            emit({"operation": "exit", "note": "EC policy may remain set; inspect before an explicit resume command."})


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("operation", nargs="?", default="status",
                   choices=["status", "monitor", "inspect", "stop", "resume", "control"])
    p.add_argument("--dll", help="Absolute path to a trusted compatible WinRing0 DLL")
    p.add_argument("--bridge", help="Path to Windows/BM5235ECBridge.exe beside DLL/SYS")
    p.add_argument("--board", choices=["BM5235"])
    p.add_argument("--experimental-raw-io", action="store_true")
    p.add_argument("--enable-write", action="store_true")
    p.add_argument("--verified-stop-on-ac", action="store_true",
                   help="Control prerequisite: stop/resume already verified on this machine")
    p.add_argument("--take-over-stop", action="store_true")
    p.add_argument("--leave-stop", action="store_true")
    p.add_argument("--low", type=int, default=60)
    p.add_argument("--high", type=int, default=80)
    p.add_argument("--interval", type=float, default=10)
    p.add_argument("--duration", type=float, default=300, help="Loop seconds; 0 means until Ctrl+C")
    args = p.parse_args(argv)
    if not 0 < args.low < args.high <= 100 or args.interval < 2 or args.duration < 0:
        p.error("Require 0 < low < high <= 100, interval >= 2, duration >= 0")
    if args.operation == "status":
        emit({"operation": "status", "writes_ec_ram": False, "windows": windows_status()})
        return
    if args.operation == "monitor":
        stopped, start = False, time.monotonic()
        try:
            while True:
                status = windows_status()
                if status["soc"] is not None and status["ac"] is True and status["battery_present"]:
                    stopped = hysteresis(status["soc"], stopped, args.low, args.high)
                emit({"operation": "dry_run", "proposed_stop": stopped,
                      "writes_ec_ram": False, "windows": status})
                if args.duration and time.monotonic() - start >= args.duration:
                    break
                time.sleep(args.interval)
        except KeyboardInterrupt:
            pass
        return
    if not (args.dll or args.bridge) or not args.experimental_raw_io or args.board != "BM5235":
        p.error("EC operations require --bridge (or --dll), --board BM5235 and --experimental-raw-io")
    if args.dll and args.bridge:
        p.error("Choose exactly one transport: --bridge or --dll")
    if args.operation in ("stop", "resume", "control") and not args.enable_write:
        p.error("No EC RAM write is enabled; explicit --enable-write is required")
    if args.operation == "control" and not args.verified_stop_on_ac:
        p.error("Verify stop/resume and adapter supply first, then pass --verified-stop-on-ac")
    if os.name != "nt":
        p.error("Raw I/O requires Windows")
    with SingleInstance():
        ports = NativeBridgePorts(args.bridge, args.enable_write) if args.bridge else WinRingPorts(args.dll)
        try:
            ec = EC(ports)
            if args.operation == "inspect":
                emit({"operation": "inspect", "writes_ec_ram": False,
                      "windows": windows_status(), "ec": ec.snapshot()})
            elif args.operation == "control":
                run_control(ec, args)
            else:
                result = set_stopped(ec, args.operation == "stop")
                emit({"operation": args.operation, "ec": result,
                      "note": "Firmware flag checked; physical charge/supply behavior still needs observation."})
        finally:
            ports.close()


if __name__ == "__main__":
    try:
        main()
    except Exception as error:
        emit({"error": str(error), "automatic_retry": False})
        sys.exit(1)
