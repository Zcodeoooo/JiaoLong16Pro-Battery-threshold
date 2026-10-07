"""Controlled stop/restore experiment; no firmware flashing.

Default: inspect only. --test-stop-and-restore is explicit EC policy writing.
Run in an administrator terminal, using the supplied Windows bridge.
Normally requires AC, SOC 60..79, and positive charging status. An optional
--allow-idle flag performs mode validation only at e.g. 99%; it cannot verify
that an actively charging battery stops. Results are JSON lines on stdout.
"""
import argparse
from pathlib import Path
import sys
import time
import bm5235_battery as t
import battery_telemetry as telemetry


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--bridge", default=str(Path(__file__).resolve().parent / "Windows/BM5235ECBridge.exe"))
    p.add_argument("--test-stop-and-restore", action="store_true")
    p.add_argument("--allow-idle", action="store_true")
    args = p.parse_args()
    with t.SingleInstance():
        ports = t.NativeBridgePorts(args.bridge, allow_writes=args.test_stop_and_restore)
        ec = t.EC(ports)
        changed = False
        try:
            before, os_before = ec.snapshot(), t.windows_status()
            battery_before = telemetry.sample()
            t.emit({"phase": "before", "ec": before, "windows": os_before,
                    "battery_telemetry": battery_before})
            if not args.test_stop_and_restore:
                return
            t.validate(before, os_before)
            if before["mode"] != 0:
                raise RuntimeError("Test requires initial normal mode 00; refusing to take over another mode")
            if not args.allow_idle and (not 60 <= before["soc"] < 80 or not before["charging"] or not os_before["charging"]):
                raise RuntimeError("For charging verification, prepare AC + SOC 60..79 + charging first. --allow-idle checks mode only.")
            changed = True
            stopped = t.set_stopped(ec, True)
            t.emit({"phase": "stop_submitted", "ec": stopped})
            checks = []
            for delay in (3, 7, 10, 10):
                time.sleep(delay)
                snapshot, os_status = ec.snapshot(), t.windows_status()
                t.validate(snapshot, os_status)
                battery = telemetry.sample()
                checks.append((snapshot, os_status, battery))
                t.emit({"phase": "observe_stop", "ec": snapshot, "windows": os_status,
                        "battery_telemetry": battery})
            last, os_last, _ = checks[-1]
            mode_ok = last["mode"] == 2 and last["state"] == 0x31 and last["requested_current_zero"]
            reported_supply_ok = all(s["ac"] and not s["discharging"] and w["ac"] for s, w, _ in checks)
            reported_supply_ok = reported_supply_ok and all(not s["charging"] and w["charging"] is False
                                                            for s, w, _ in checks[-2:])
            t.emit({"phase": "stop_result", "mode_and_requested_current_pass": mode_ok,
                    "reported_supply_pass": reported_supply_ok,
                    "initially_charging": bool(before["charging"] and os_before["charging"]),
                    "physical_current_measured": False,
                    "note": "Mode/OS flags do not replace real current/remaining-capacity observations."})
            # Always finish a healthy controlled test by restoring normal policy.
            restored = t.set_stopped(ec, False)
            changed = False
            t.emit({"phase": "restore_submitted", "ec": restored})
            resumed = False
            for _ in range(3):
                time.sleep(10)
                after, os_after = ec.snapshot(), t.windows_status()
                t.validate(after, os_after)
                battery_after = telemetry.sample()
                resumed = after["mode"] == 0 and after["charging"] and os_after["charging"] is True
                rate_pass = telemetry.rate_transition(battery_before, [c[2] for c in checks[-2:]], battery_after)
                t.emit({"phase": "after_restore", "ec": after, "windows": os_after,
                        "battery_telemetry": battery_after})
                if args.allow_idle or (resumed and rate_pass is not False):
                    break
            if not mode_ok or not reported_supply_ok:
                raise RuntimeError("Stop-mode/supply flags did not pass; original policy restored, further analysis needed")
            t.emit({"phase": "complete", "normal_policy_restored": after["mode"] == 0,
                    "charging_transition_observed": bool(before["charging"] and os_before["charging"])
                    and not last["charging"] and not os_last["charging"],
                    "charging_resumed_observed": bool(resumed),
                    "battery_reported_rate_transition_pass": rate_pass,
                    "physical_current_measured": False,
                    "idle_only_test": args.allow_idle})
            if not args.allow_idle and not resumed:
                raise RuntimeError("Normal mode restored, but charging did not resume within observation period")
        finally:
            if changed and not ec.poisoned:
                try:
                    t.emit({"phase": "cleanup_restore", "ec": t.set_stopped(ec, False, require_ac=False)})
                except Exception as error:
                    t.emit({"phase": "cleanup_failed", "error": str(error), "automatic_retry": False})
            elif changed:
                t.emit({"phase": "uncertain_exit", "note": "Transport failed; no cleanup write. Inspect mode before explicit resume."})
            ports.close()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        t.emit({"phase": "interrupted"})
        sys.exit(130)
    except Exception as error:
        t.emit({"error": str(error), "automatic_retry": False})
        sys.exit(1)
