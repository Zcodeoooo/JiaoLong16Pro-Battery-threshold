"""BM5235 / MRID6 EC 00.28 native dual-threshold configuration.

Default is Windows status only. Enable configures the existing 10/0D mailbox
command, observes briefly, and EXITS WITHOUT RESTORING: the EC keeps control.
Native initialization first holds charging when SOC is between the thresholds;
SOC above the upper threshold can activate the firmware's discharge helper.
The default enable path therefore requires SOC strictly below the upper limit.
No firmware flashing, persistent service, automatic elevation, or direct policy
state writes are performed. Read NATIVE_README.md before using this prototype.
"""
import argparse
import contextlib
from pathlib import Path
import sys
import time
import battery_telemetry as telemetry
import bm5235_battery as t
from run_control import Tee

NATIVE_MODE = 0x48
NATIVE_STATE = 0x32


class NativeEC(t.EC):
    def read(self, address):
        if address in (0x8153, 0x8154):
            return self.transact(0x92, (address >> 8, address & 255), True)
        return super().read(address)

    def mailbox_write(self, address, value):
        fixed = {(0x8151, 0x0D), (0x8151, 0x0F), (0x8150, 0x10)}
        parameter = address in (0x8153, 0x8154) and isinstance(value, int) and 1 <= value <= 100
        if (address, value) not in fixed and not parameter:
            raise ValueError("Only native threshold parameters / enable / restore mailbox writes are allowed")
        self.transact(0x93, (address >> 8, address & 255, value))

    def snapshot(self):
        result = super().snapshot()
        raw = result["raw"]
        result.update({"native_substate": int(raw["83A0"], 16),
                       "native_high": int(raw["83A1"], 16), "native_low": int(raw["83A2"], 16),
                       "mailbox_high": self.read(0x8153), "mailbox_low": self.read(0x8154),
                       "native_enabled": result["mode"] == NATIVE_MODE})
        return result


def validate(snapshot, require_ac=True):
    t.validate(snapshot, t.windows_status(), require_ac, allowed_modes=(0, 2, NATIVE_MODE))


def check_mailbox(ec, expected_mode):
    if ec.read(0x8150) != 0 or ec.read(0x83C0) != expected_mode:
        raise RuntimeError("Mode/mailbox changed before native command submission; no trigger sent")


def finish_command(ec, expected_mode):
    deadline = time.monotonic() + 3
    while ec.read(0x8150) != 0:
        if time.monotonic() >= deadline:
            ec.poisoned = True
            raise TimeoutError("Native mailbox timeout; no automatic retry or cleanup write")
        time.sleep(0.02)
    if ec.read(0x8152) != 0x55 or ec.read(0x83C0) != expected_mode:
        ec.poisoned = True
        raise RuntimeError("Native mailbox result/mode mismatch; inspect before any further write")
    return ec.snapshot()


def wait_normal(ec):
    deadline = time.monotonic() + 8
    while True:
        snapshot = ec.snapshot()
        validate(snapshot, require_ac=False)
        if (snapshot["mode"] == 0 and snapshot["native_substate"] == 0
                and snapshot["state"] not in (0x31, NATIVE_STATE)
                and int(snapshot["raw"]["8395"], 16) & 7 == 0):
            return snapshot
        if time.monotonic() >= deadline:
            raise RuntimeError("Mode reset submitted, but firmware cleanup did not settle; no native enable sent")
        time.sleep(0.25)


def disable_native(ec):
    before = ec.snapshot()
    validate(before, require_ac=False)
    if before["mode"] != 0:
        check_mailbox(ec, before["mode"])
        ec.mailbox_write(0x8151, 0x0F)
        ec.mailbox_write(0x8150, 0x10)
        finish_command(ec, 0)
    return wait_normal(ec)


def guard_start(snapshot, high, allow_initial_discharge):
    os_status = t.windows_status()
    t.validate(snapshot, os_status, allowed_modes=(0, 2, NATIVE_MODE))
    if not allow_initial_discharge and max(snapshot["soc"], os_status["soc"]) >= high:
        raise RuntimeError(f"Native initialization may discharge above upper limit. Default requires SOC < {high}; no enable trigger sent")


def enable_native(ec, low=60, high=80, allow_initial_discharge=False):
    if not isinstance(low, int) or not isinstance(high, int) or not 0 < low < high <= 100:
        raise ValueError("Require integer 0 < low < high <= 100")
    before = ec.snapshot()
    validate(before)
    # Reusing an already settled identical policy does not reset its hysteresis.
    if (before["mode"] == NATIVE_MODE and before["state"] == NATIVE_STATE
            and before["native_substate"] in (2, 3)
            and (before["native_low"], before["native_high"]) == (low, high)):
        before["configuration_reused"] = True
        return before
    guard_start(before, high, allow_initial_discharge)
    if before["mode"] != 0:
        before = disable_native(ec)
        t.emit({"phase": "normal_policy_prepared", "ec": before})
    else:
        before = wait_normal(ec)
    guard_start(before, high, allow_initial_discharge)
    check_mailbox(ec, 0)
    # Data first, subcommand second, main command LAST. No writes to 83A0 or 83C0.
    ec.mailbox_write(0x8153, high)
    check_mailbox(ec, 0)
    ec.mailbox_write(0x8154, low)
    check_mailbox(ec, 0)
    if ec.read(0x8153) != high or ec.read(0x8154) != low:
        ec.poisoned = True
        raise RuntimeError("Native parameter readback mismatch; no enable trigger sent")
    ec.mailbox_write(0x8151, 0x0D)
    # Recheck SOC after parameter preparation before allowing initialization.
    guard_start(ec.snapshot(), high, allow_initial_discharge)
    check_mailbox(ec, 0)
    ec.mailbox_write(0x8150, 0x10)
    after = finish_command(ec, NATIVE_MODE)
    if (after["native_high"], after["native_low"]) != (high, low):
        ec.poisoned = True
        raise RuntimeError("Native active threshold readback mismatch; inspect before further write")
    after["configuration_reused"] = False
    return after


def observe_native(ec, args):
    deadline = time.monotonic() + args.observe_seconds
    while True:
        snapshot = ec.snapshot()
        validate(snapshot)
        if snapshot["mode"] != NATIVE_MODE or (snapshot["native_low"], snapshot["native_high"]) != (args.low, args.high):
            raise RuntimeError("Native mode/thresholds changed during observation")
        battery = telemetry.sample()
        t.emit({"phase": "observe_native", "ec": snapshot, "windows": t.windows_status(),
                "battery_telemetry": battery})
        if not args.allow_initial_discharge and (snapshot["discharging"] or (
                snapshot["native_substate"] == 1 and snapshot["soc"] > args.high)):
            # The transport and recognized mode are healthy: explicitly end an
            # unexpected default experiment using the ORIGINAL restore command.
            restored = disable_native(ec)
            t.emit({"phase": "unexpected_discharge_restored", "ec": restored})
            raise RuntimeError("Unexpected discharge indication; native experiment ended and normal policy restored")
        if time.monotonic() >= deadline:
            break
        time.sleep(min(args.interval, max(0, deadline - time.monotonic())))
    settled = snapshot["state"] == NATIVE_STATE and snapshot["native_substate"] in (2, 3)
    if not settled and not (args.allow_initial_discharge and snapshot["native_substate"] == 1):
        raise RuntimeError("Native flags/parameters set, but scheduler/substate did not settle; inspect before an explicit disable")
    t.emit({"phase": "complete", "native_enabled": True, "ec_autonomous": True,
            "resident_program_required": False, "low": args.low, "high": args.high,
            "native_state_settled": settled, "native_substate": snapshot["native_substate"],
            "initial_discharge_allowed": args.allow_initial_discharge,
            "reset_persistence_verified": False,
            "note": "Configuration stays active after this process exits; disable uses 10/0F. Full native threshold cycle still needs live verification."})


def execute(args):
    with t.SingleInstance():
        ports = t.NativeBridgePorts(args.bridge, allow_writes=args.operation in ("enable", "disable"))
        ec = NativeEC(ports)
        try:
            before = ec.snapshot()
            t.emit({"phase": "before", "operation": args.operation, "ec": before,
                    "windows": t.windows_status(), "battery_telemetry": telemetry.sample()})
            if args.operation == "inspect":
                return
            if args.operation == "disable":
                after = disable_native(ec)
                t.emit({"phase": "complete", "native_enabled": False, "normal_policy_restored": True, "ec": after})
                return
            after = enable_native(ec, args.low, args.high, args.allow_initial_discharge)
            t.emit({"phase": "native_reused" if after.get("configuration_reused") else "native_submitted",
                    "ec": after, "low": args.low, "high": args.high,
                    "initial_discharge_allowed": args.allow_initial_discharge})
            observe_native(ec, args)
        except BaseException:
            t.emit({"phase": "exit_notice", "transport_healthy": not ec.poisoned,
                    "note": "Native policy may remain active. No blind retry/cleanup. Inspect, then explicitly disable if needed."})
            raise
        finally:
            ports.close()


def main(argv=None):
    root = Path(__file__).resolve().parent
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("operation", nargs="?", default="status", choices=("status", "inspect", "enable", "disable"))
    p.add_argument("--bridge", default=str(root / "Windows/BM5235ECBridge.exe"))
    p.add_argument("--board", choices=("BM5235",))
    p.add_argument("--experimental-raw-io", action="store_true")
    p.add_argument("--enable-write", action="store_true")
    p.add_argument("--low", type=int, default=60)
    p.add_argument("--high", type=int, default=80)
    p.add_argument("--allow-initial-discharge", action="store_true",
                   help="Explicitly permit the original native initialization discharge branch above the upper limit")
    p.add_argument("--observe-seconds", type=float, default=30)
    p.add_argument("--interval", type=float, default=5)
    p.add_argument("--log-file", type=Path)
    p.add_argument("--append-log", action="store_true", help="Append diagnostics instead of replacing the log")
    args = p.parse_args(argv)
    if not 0 < args.low < args.high <= 100 or not 5 <= args.observe_seconds <= 120 or args.interval < 2:
        p.error("Require 0 < low < high <= 100, observation 5..120 seconds, interval >= 2")
    if args.operation == "status":
        t.emit({"operation": "status", "writes_ec_ram": False, "windows": t.windows_status()})
        return
    if args.board != "BM5235" or not args.experimental_raw_io:
        p.error("EC access requires --board BM5235 --experimental-raw-io")
    if args.operation in ("enable", "disable") and not args.enable_write:
        p.error("No EC RAM write enabled; explicit --enable-write is required")
    if args.log_file:
        with args.log_file.open("a" if args.append_log else "w", encoding="utf-8", buffering=1) as log:
            with contextlib.redirect_stdout(Tee(sys.stdout, log)):
                try:
                    execute(args)
                except BaseException as error:
                    t.emit({"error": str(error) or type(error).__name__, "automatic_retry": False})
                    raise
    else:
        execute(args)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(130)
    except Exception as error:
        print("Native configuration stopped: " + str(error), file=sys.stderr)
        sys.exit(1)
