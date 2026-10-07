"""BM5235 60/80 controller launcher, gated on the completed charging test.

Run from an administrator terminal. Defaults to continuous operation.
Normal Ctrl+C restores the policy present at startup. All output is also
appended to outputs/control.jsonl. No automatic elevation or installation.
"""
import argparse
import contextlib
import json
from pathlib import Path
import sys
import bm5235_battery as t


def check_evidence(path):
    events = [json.loads(line) for line in path.read_text(encoding="utf-8-sig").splitlines() if line.strip()]
    if any("error" in e or e.get("phase") in ("cleanup_failed", "uncertain_exit", "interrupted") for e in events):
        raise RuntimeError("Charging-test log contains an error; review it before control")
    before = next((e for e in events if e.get("phase") == "before"), {})
    stop = next((e for e in events if e.get("phase") == "stop_result"), {})
    last = events[-1] if events else {}
    if tuple(before.get("ec", {}).get("version", [])) != t.EXPECTED_VERSION:
        raise RuntimeError("Charging-test log does not match EC 00.28.00.00")
    required = (last.get("phase") == "complete", last.get("idle_only_test") is False,
                last.get("normal_policy_restored") is True, last.get("charging_transition_observed") is True,
                last.get("charging_resumed_observed") is True,
                last.get("battery_reported_rate_transition_pass") is True,
                stop.get("mode_and_requested_current_pass") is True,
                stop.get("reported_supply_pass") is True, stop.get("initially_charging") is True)
    if not all(required):
        raise RuntimeError("Complete a successful TestCharging.cmd run before starting control")


class Tee:
    def __init__(self, terminal, log):
        self.terminal, self.log = terminal, log

    def write(self, text):
        self.log.write(text)
        return self.terminal.write(text)

    def flush(self):
        self.log.flush()
        self.terminal.flush()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--duration", type=float, default=0, help="Seconds; 0 runs until Ctrl+C")
    args = p.parse_args()
    if args.duration < 0:
        p.error("Duration must be nonnegative")
    root = Path(__file__).resolve().parent
    check_evidence(root / "charging_test.jsonl")
    with (root / "control.jsonl").open("a", encoding="utf-8", buffering=1) as log:
        with contextlib.redirect_stdout(Tee(sys.stdout, log)):
            t.emit({"operation": "session_start", "low": 60, "high": 80,
                    "interval_seconds": 10, "duration_seconds": args.duration,
                    "evidence": "charging_test.jsonl"})
            try:
                t.main(["control", "--board", "BM5235", "--bridge", str(root / "Windows/BM5235ECBridge.exe"),
                        "--experimental-raw-io", "--enable-write", "--verified-stop-on-ac",
                        "--low", "60", "--high", "80", "--interval", "10", "--duration", str(args.duration)])
            except BaseException as error:
                t.emit({"error": str(error) or type(error).__name__, "automatic_retry": False})
                raise


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(130)
    except Exception as error:
        print("Controller stopped: " + str(error), file=sys.stderr)
        sys.exit(1)
