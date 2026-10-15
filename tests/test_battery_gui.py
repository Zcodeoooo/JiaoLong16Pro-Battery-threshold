"""No driver access: exercise UI behavior and the existing CLI boundary."""
import json
from pathlib import Path
import queue
import tempfile
import tkinter as tk
import unittest
from unittest.mock import patch

import battery_gui as gui


STATUS = {"ac": True, "soc": 65, "battery_present": True, "charging": False}


class ThresholdTests(unittest.TestCase):
    def test_threshold_boundaries(self):
        for low, high in (("1", "2"), ("60", "80"), ("99", "100")):
            self.assertEqual(gui.validate_thresholds(low, high), (int(low), int(high)))
        for low, high in ((0, 80), (80, 80), (90, 80), (60, 101), ("", 80),
                          ("60.5", 80), (True, 80), (None, 80)):
            with self.subTest(low=low, high=high), self.assertRaises(ValueError):
                gui.validate_thresholds(low, high)


class WorkerTests(unittest.TestCase):
    def setUp(self):
        self.temp_base = gui.RESOURCE_DIR / "build" / "test-temp"
        self.temp_base.mkdir(parents=True, exist_ok=True)
        self.temp = tempfile.TemporaryDirectory(dir=self.temp_base)
        self.log_dir = Path(self.temp.name) / "logs"
        self.events = queue.Queue()
        self.admin = patch.object(gui, "is_admin", return_value=True)
        self.admin.start()

    def tearDown(self):
        self.admin.stop()
        assert Path(self.temp.name).resolve().is_relative_to(self.temp_base.resolve())
        self.temp.cleanup()

    def finish(self):
        records = []
        while not self.events.empty():
            kind, value = self.events.get_nowait()
            if kind == "finished":
                return value, records
            records.append(value)
        self.fail("Missing completion event")

    def test_inspect_never_enables_writes(self):
        with patch.object(gui.native, "main") as main:
            gui.run_operation("inspect", 60, 80, True, self.log_dir, self.events)
        args = main.call_args.args[0]
        self.assertNotIn("--enable-write", args)
        self.assertNotIn("--allow-initial-discharge", args)
        self.assertIn("--experimental-raw-io", args)
        self.assertEqual(args[args.index("--bridge") + 1], str(gui.RESOURCE_DIR / "Windows/BM5235ECBridge.exe"))
        self.assertTrue(self.finish()[0].success)

    def test_enable_parameters_and_windowed_logging(self):
        def backend(args):
            self.assertIn("--enable-write", args)
            self.assertNotIn("--allow-initial-discharge", args)
            self.assertIn("--no-observe", args)
            self.assertEqual(args[args.index("--low") + 1], "50")
            self.assertEqual(args[args.index("--high") + 1], "75")
            gui.battery.emit({"phase": "complete", "native_enabled": True})
        with patch.object(gui.native, "main", side_effect=backend), patch("sys.stdout", None):
            gui.run_operation("enable", 50, 75, False, self.log_dir, self.events)
        result, events = self.finish()
        self.assertTrue(result.success)
        self.assertTrue(events[0]["native_enabled"])
        self.assertEqual(json.loads(result.log_path.read_text(encoding="utf-8"))["phase"], "complete")

    def test_initial_discharge_requires_explicit_selection(self):
        with patch.object(gui.native, "main") as main:
            gui.run_operation("enable", 60, 80, True, self.log_dir, self.events)
        self.assertIn("--allow-initial-discharge", main.call_args.args[0])

    def test_failure_is_logged_without_retry(self):
        with patch.object(gui.native, "main", side_effect=TimeoutError("EC timeout")) as main:
            gui.run_operation("enable", 60, 80, False, self.log_dir, self.events)
        result, events = self.finish()
        self.assertFalse(result.success)
        self.assertEqual(main.call_count, 1)
        self.assertFalse(events[-1]["automatic_retry"])
        self.assertEqual(json.loads(result.log_path.read_text(encoding="utf-8"))["error"], "EC timeout")

    def test_invalid_request_rejected_before_backend(self):
        for operation, low, high in (("unknown", 60, 80), ("enable", 80, 60)):
            with patch.object(gui.native, "main") as main:
                gui.run_operation(operation, low, high, False, self.log_dir, self.events)
                main.assert_not_called()
            self.assertFalse(self.finish()[0].success)

    def test_permission_or_missing_resources_prevent_backend(self):
        with patch.object(gui, "is_admin", return_value=False), patch.object(gui.native, "main") as main:
            gui.run_operation("disable", 60, 80, False, self.log_dir, self.events)
            main.assert_not_called()
        self.assertFalse(self.finish()[0].success)
        with patch.object(gui, "resource_check", side_effect=FileNotFoundError("missing")), patch.object(gui.native, "main") as main:
            gui.run_operation("enable", 60, 80, False, self.log_dir, self.events)
            main.assert_not_called()
        self.assertFalse(self.finish()[0].success)


class InterfaceTests(unittest.TestCase):
    def setUp(self):
        self.admin = patch.object(gui, "is_admin", return_value=True)
        self.power = patch.object(gui.battery, "windows_status", return_value=STATUS.copy())
        self.backend = patch.object(gui.native, "main", side_effect=AssertionError("Unrequested EC access"))
        self.admin.start()
        self.power.start()
        self.backend.start()
        self.root = tk.Tk()
        self.app = gui.BatteryApp(self.root, start_telemetry=False)
        self.root.update()

    def tearDown(self):
        # Remove scheduled callbacks before destroying the interpreter.
        for callback in self.root.tk.splitlist(self.root.tk.call("after", "info")):
            self.root.tk.call("after", "cancel", callback)
        self.root.destroy()
        self.backend.stop()
        self.power.stop()
        self.admin.stop()

    def test_startup_only_reads_windows_and_defaults_are_conservative(self):
        self.assertEqual(self.app.soc.get(), "65%")
        self.assertFalse(self.app.allow_discharge.get())
        self.assertEqual(self.app.policy.get(), "尚未读取 EC")
        self.assertFalse(self.app.busy)

    def test_invalid_threshold_cannot_start_enable(self):
        self.app.low.set("90")
        with patch.object(gui.threading, "Thread") as thread:
            self.app.start("enable")
        thread.assert_not_called()
        self.assertFalse(self.app.busy)

    def test_inspect_and_restore_ignore_invalid_threshold_fields(self):
        self.app.low.set("not a number")
        for operation in ("inspect", "disable"):
            self.app._set_busy(False)
            with patch.object(gui.threading, "Thread") as thread:
                self.app.start(operation)
            self.assertEqual(thread.call_args.kwargs["args"][:3], (operation, 60, 80))
            thread.return_value.start.assert_called_once()

    def test_running_operation_disables_actions_and_close_waits(self):
        self.app._set_busy(True)
        self.assertEqual(str(self.app.disable_button["state"]), "disabled")
        with patch.object(self.root, "destroy") as destroy:
            self.app.close()
        destroy.assert_not_called()
        self.assertIn("请等操作完成", self.app.notice.get())

    def test_presets_do_not_claim_ec_configuration_changed(self):
        ec = {"mode": 72, "version": [0, 40, 0, 0], "native_low": 60,
              "native_high": 80, "native_substate": 2}
        self.app._show_ec(ec)
        self.app.set_preset(50, 70)
        self.assertEqual((self.app.low.get(), self.app.high.get()), ("50", "70"))
        self.assertIn("60% / 80%", self.app.policy.get())

    def test_failure_invalidates_stale_snapshot(self):
        self.app._finish(gui.OperationResult("enable", False, Path("missing.jsonl"), "EC timeout"))
        self.assertIn("重新读取", self.app.policy.get())
        self.assertIn("通信超时", self.app.notice.get())

    def test_nonadmin_actions_are_disabled(self):
        self.app.admin = False
        self.app._set_busy(False)
        self.assertEqual(str(self.app.enable_button["state"]), "disabled")
        with patch.object(gui.threading, "Thread") as thread:
            self.app.start("inspect")
        thread.assert_not_called()

    def test_rates_update_and_clear_stale_values_on_failure(self):
        self.app._show_rates({"available": True, "batteries": [
            {"ChargeRate": 19420, "DischargeRate": 0, "RateUnit": "mW"}]})
        self.assertEqual(self.app.charge_rate.get(), "19.42 W")
        self.assertEqual(self.app.discharge_rate.get(), "0.00 W")
        self.app._show_rates({"available": False, "batteries": []})
        self.assertEqual(self.app.charge_rate.get(), "--")
        self.assertEqual(self.app.discharge_rate.get(), "--")

    def test_telemetry_queries_do_not_overlap(self):
        with patch.object(gui.threading, "Thread") as thread:
            self.app._refresh_telemetry()
            self.app._refresh_telemetry()
        self.assertEqual(thread.call_count, 1)
        self.assertTrue(self.app.telemetry_pending)


class RateTests(unittest.TestCase):
    def test_discharge_power_and_multiple_batteries(self):
        cells = [{"ChargeRate": 0, "DischargeRate": 15250, "RateUnit": "mW"},
                 {"ChargeRate": 0, "DischargeRate": 500, "RateUnit": "mW"}]
        self.assertEqual(gui.format_rates({"available": True, "batteries": cells})[:2], ("0.00 W", "15.75 W"))

    def test_unknown_is_not_displayed_as_zero(self):
        for value in (None, -1, 0x80000000, 0xFFFFFFFF, True):
            data = {"available": True, "batteries": [{"ChargeRate": value, "DischargeRate": 0, "RateUnit": "mW"}]}
            self.assertEqual(gui.format_rates(data)[:2], ("--", "0.00 W"))

    def test_relative_and_unknown_units_are_not_watts(self):
        for unit, label in (("relative", "50 相对单位/h"), ("unknown", "50（原始值）")):
            data = {"available": True, "batteries": [{"ChargeRate": 50, "DischargeRate": 0, "RateUnit": unit}]}
            self.assertEqual(gui.format_rates(data)[0], label)


class LaunchTests(unittest.TestCase):
    def test_source_start_requests_admin_before_creating_window(self):
        with patch("sys.argv", ["battery_gui.py"]), patch.object(gui, "is_admin", return_value=False), \
                patch.object(gui, "launch_as_admin") as elevate, patch.object(gui.tk, "Tk") as window:
            gui.main()
        elevate.assert_called_once()
        window.assert_not_called()


class NativeNoObservationTests(unittest.TestCase):
    def test_gui_path_finishes_after_readback_without_sampling_or_observing(self):
        snapshot = {"mode": gui.native.NATIVE_MODE, "state": gui.native.NATIVE_STATE,
                    "native_substate": 1, "native_low": 60, "native_high": 80}
        with patch.object(gui.native.t, "SingleInstance"), \
                patch.object(gui.native.t, "NativeBridgePorts") as ports, \
                patch.object(gui.native, "NativeEC") as ec, \
                patch.object(gui.native, "enable_native", return_value=snapshot) as enable, \
                patch.object(gui.native, "observe_native") as observe, \
                patch.object(gui.native.telemetry, "sample") as sample, \
                patch.object(gui.native.t, "windows_status", return_value=STATUS), \
                patch.object(gui.native.t, "emit") as emit:
            ec.return_value.snapshot.return_value = snapshot
            gui.native.main(["enable", "--board", "BM5235", "--experimental-raw-io", "--enable-write", "--no-observe"])
        enable.assert_called_once()
        observe.assert_not_called()
        sample.assert_not_called()
        ports.return_value.close.assert_called_once()
        complete = emit.call_args.args[0]
        self.assertEqual(complete["phase"], "complete")
        self.assertFalse(complete["observation_performed"])
        self.assertFalse(complete["native_state_settled"])
        self.assertEqual(complete["ec"], snapshot)

    def test_command_line_keeps_existing_observation_default(self):
        snapshot = {"mode": gui.native.NATIVE_MODE, "state": gui.native.NATIVE_STATE,
                    "native_substate": 2, "native_low": 60, "native_high": 80}
        with patch.object(gui.native.t, "SingleInstance"), patch.object(gui.native.t, "NativeBridgePorts"), \
                patch.object(gui.native, "NativeEC") as ec, \
                patch.object(gui.native, "enable_native", return_value=snapshot), \
                patch.object(gui.native, "observe_native") as observe, \
                patch.object(gui.native.telemetry, "sample"), \
                patch.object(gui.native.t, "windows_status", return_value=STATUS), patch.object(gui.native.t, "emit"):
            ec.return_value.snapshot.return_value = snapshot
            gui.native.main(["enable", "--board", "BM5235", "--experimental-raw-io", "--enable-write"])
        observe.assert_called_once()


if __name__ == "__main__":
    unittest.main()
