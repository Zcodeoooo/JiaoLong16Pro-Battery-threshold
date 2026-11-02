"""No EC/driver access: lighting protocol, failure paths and UI integration."""
from pathlib import Path
import queue
import tempfile
import tkinter as tk
import unittest
from unittest.mock import patch

import battery_gui as gui
import bm5235_lighting as lighting


class FakeEC:
    def __init__(self, version=lighting.SUPPORTED_VERSIONS[0]):
        self.mem = {0x8150: 0, 0x8151: 0, 0x8152: 0x55, 0x8153: 0, 0x8154: 0, 0x8155: 0,
                    0x84E8: 1, 0x84E9: 11, 0x84EA: 22, 0x84EB: 33, 0x83C0: 0x48}
        self.mem.update(zip(range(0x8410, 0x8414), version))
        self.writes = []
        self.poisoned = False
        self.corrupt_parameter = False
        self.complete = True
        self.apply = True

    def read(self, address):
        return self.mem[address]

    def mailbox_write(self, address, value):
        self.writes.append((address, value))
        self.mem[address] = value ^ 1 if self.corrupt_parameter and address == 0x8154 else value
        if address == 0x8150 and self.complete:
            if self.apply:
                if self.mem[0x8151] == 6:
                    self.mem[0x84E8] = self.mem[0x8153]
                elif self.mem[0x8151] == 7:
                    for dest, src in zip(range(0x84E9, 0x84EC), lighting.PARAMETERS):
                        self.mem[dest] = self.mem[src]
            self.mem[0x8150] = 0


class LightingProtocolTests(unittest.TestCase):
    def test_current_0028_firmware_accepts_read_color_and_mode(self):
        ec = FakeEC((0, 0x28, 0, 0))
        self.assertEqual(lighting.read_lighting(ec)['version'], [0, 0x28, 0, 0])
        self.assertEqual(lighting.submit(ec, 7, (0, 128, 255))['rgb'], [0, 128, 255])
        self.assertEqual(lighting.submit(ec, 6, (2,))['mode'], 2)

    def test_rgb_uses_three_parameters_and_triggers_last(self):
        ec = FakeEC()
        after = lighting.submit(ec, 7, (0, 128, 255))
        self.assertEqual(ec.writes, [(0x8153, 0), (0x8154, 128), (0x8155, 255),
                                     (0x8151, 7), (0x8150, 0x40)])
        self.assertEqual(after['rgb'], [0, 128, 255])
        self.assertEqual(after['mode'], 1)
        self.assertEqual(ec.mem[0x83C0], 0x48)

    def test_mode_does_not_write_rgb_or_charging_state(self):
        ec = FakeEC()
        after = lighting.submit(ec, 6, (2,))
        self.assertEqual(ec.writes, [(0x8153, 2), (0x8151, 6), (0x8150, 0x40)])
        self.assertEqual(after['mode'], 2)
        self.assertEqual(after['rgb'], [11, 22, 33])
        self.assertEqual(ec.mem[0x83C0], 0x48)

    def test_unsupported_firmware_or_busy_mailbox_prevents_all_writes(self):
        for field, value in ((0x8411, 0x24), (0x8150, 0x10)):
            with self.subTest(field=field):
                ec = FakeEC(); ec.mem[field] = value
                with self.assertRaises(RuntimeError):
                    lighting.submit(ec, 7, (1, 2, 3))
                self.assertEqual(ec.writes, [])

    def test_parameter_corruption_prevents_trigger(self):
        ec = FakeEC(); ec.corrupt_parameter = True
        with self.assertRaisesRegex(RuntimeError, '参数回读'):
            lighting.submit(ec, 7, (1, 2, 3))
        self.assertNotIn((0x8150, 0x40), ec.writes)
        self.assertTrue(ec.poisoned)

    def test_completion_does_not_count_as_success_without_setting_readback(self):
        ec = FakeEC(); ec.apply = False
        with self.assertRaisesRegex(RuntimeError, '设置回读'):
            lighting.submit(ec, 7, (1, 2, 3))
        self.assertEqual(ec.writes.count((0x8150, 0x40)), 1)
        self.assertTrue(ec.poisoned)

    def test_timeout_has_no_resend_or_cleanup(self):
        ec = FakeEC(); ec.complete = False
        with patch.object(lighting.time, 'monotonic', side_effect=[0, 4]):
            with self.assertRaises(TimeoutError):
                lighting.submit(ec, 7, (1, 2, 3))
        self.assertEqual(ec.writes.count((0x8150, 0x40)), 1)
        self.assertEqual(len(ec.writes), 5)
        self.assertTrue(ec.poisoned)

    def test_write_allowlist_is_lighting_only(self):
        ec = lighting.LightingEC(None)
        with patch.object(ec, 'transact') as transact:
            for address, value in ((0x84E8, 2), (0x83C0, 0), (0x83C1, 0), (0x8150, 0x10),
                                   (0x8151, 0x0F), (0x8153, -1), (0x8153, 256), (0x8153, True)):
                with self.subTest(address=address, value=value), self.assertRaises(ValueError):
                    ec.mailbox_write(address, value)
            transact.assert_not_called()
            ec.mailbox_write(0x8155, 255)
            transact.assert_called_once_with(0x93, (0x81, 0x55, 255))

    def test_read_is_nonmutating_and_does_not_require_ac_or_battery(self):
        ec = FakeEC()
        self.assertEqual(lighting.read_lighting(ec)['hex'], '#0B1621')
        self.assertEqual(ec.writes, [])

    def test_validation_rejects_invalid_values_before_driver(self):
        for rgb in ((-1, 2, 3), (1, 2, 256), (True, 2, 3), (1, 2), (1.5, 2, 3)):
            with self.subTest(rgb=rgb), patch.object(lighting.battery, 'NativeBridgePorts') as ports:
                with self.assertRaises(ValueError):
                    lighting.execute('lighting_rgb', 'unused', rgb=rgb)
                ports.assert_not_called()

    def test_read_backend_uses_same_mutex_and_disables_ram_writes(self):
        with patch.object(lighting.battery, 'SingleInstance') as lock, \
                patch.object(lighting.battery, 'NativeBridgePorts') as ports, \
                patch.object(lighting, 'LightingEC', return_value=FakeEC()), \
                patch.object(lighting.battery, 'emit'):
            lighting.execute('lighting_read', 'bridge')
        lock.return_value.__enter__.assert_called_once()
        ports.assert_called_once_with('bridge', allow_writes=False)
        ports.return_value.close.assert_called_once()


class LightingInterfaceTests(unittest.TestCase):
    def setUp(self):
        self.admin = patch.object(gui, 'is_admin', return_value=True)
        self.power = patch.object(gui.battery, 'windows_status', return_value={
            'battery_present': True, 'soc': 65, 'ac': True, 'charging': False})
        self.backend = patch.object(lighting, 'execute', side_effect=AssertionError('Unrequested EC access'))
        self.admin.start(); self.power.start(); self.backend_mock = self.backend.start()
        self.root = tk.Tk()
        self.app = gui.BatteryApp(self.root, start_telemetry=False)
        self.root.update()

    def tearDown(self):
        for callback in self.root.tk.splitlist(self.root.tk.call('after', 'info')):
            self.root.tk.call('after', 'cancel', callback)
        self.root.destroy()
        self.backend.stop(); self.power.stop(); self.admin.stop()

    def test_color_previews_and_mode_presets_never_access_ec(self):
        self.app.set_rgb((170, 0, 255))
        self.app.effect_mode.set('2')
        self.assertEqual(self.app.rgb_preview_text.get(), '#AA00FF')
        self.assertEqual(self.app.color_swatch.cget('bg'), '#AA00FF')
        self.assertEqual(self.app.lighting_status.get(), '尚未读取灯光设置')
        self.backend_mock.assert_not_called()

    def test_canceling_picker_preserves_draft(self):
        self.app.set_rgb((1, 2, 3))
        with patch.object(gui.colorchooser, 'askcolor', return_value=(None, None)):
            self.app.choose_color()
        self.assertEqual([v.get() for v in self.app.rgb], ['1', '2', '3'])

    def test_invalid_color_blocks_apply_but_not_read_or_mode(self):
        self.app.rgb[0].set('256')
        with patch.object(gui.threading, 'Thread') as thread:
            self.app.start_lighting('lighting_rgb')
            thread.assert_not_called()
            self.app.start_lighting('lighting_read')
            self.assertEqual(thread.call_args.kwargs['args'][:3], ('lighting_read', None, None))

    def test_explicit_read_fills_controls_and_apply_preserves_other_draft(self):
        data = {'mode': 2, 'rgb': [11, 22, 33], 'hex': '#0B1621'}
        self.app._show_lighting(data, 'lighting_read')
        self.assertEqual([v.get() for v in self.app.rgb], ['11', '22', '33'])
        self.app.effect_mode.set('9')
        self.app._show_lighting(data, 'lighting_rgb')
        self.assertEqual(self.app.effect_mode.get(), '9')
        self.app.set_rgb((1, 2, 3))
        self.app._show_lighting(data, 'lighting_mode')
        self.assertEqual([v.get() for v in self.app.rgb], ['1', '2', '3'])

    def test_busy_blocks_both_battery_and_lighting_operations(self):
        self.app._set_busy(True)
        self.assertTrue(all(str(b['state']) == 'disabled' for b in self.app.lighting_buttons))
        with patch.object(gui.threading, 'Thread') as thread:
            self.app.start_lighting('lighting_read')
            self.app.start('enable')
            thread.assert_not_called()

    def test_lighting_failure_does_not_invalidate_battery_snapshot(self):
        self.app.policy.set('原生限充 60% / 80%')
        self.app._finish(gui.OperationResult('lighting_rgb', False, Path('missing.jsonl'), 'EC timeout'))
        self.assertIn('60% / 80%', self.app.policy.get())
        self.assertIn('重新读取', self.app.lighting_status.get())

    def test_error_reason_is_visible_beside_lighting_buttons(self):
        error = '灯光功能支持 EC 00.23.00.00 / 00.28.00.00；当前 EC 为 00.24.00.00，操作已停止。'
        self.app._finish(gui.OperationResult('lighting_read', False, Path('missing.jsonl'), error))
        self.assertIn('当前 EC 为 00.24.00.00', self.app.lighting_status.get())
        self.assertFalse(self.app.busy)
        self.assertTrue(all(str(b['state']) == 'normal' for b in self.app.lighting_buttons))


class LightingWorkerTests(unittest.TestCase):
    def test_validation_logging_and_single_backend_call(self):
        temp_base = gui.RESOURCE_DIR / 'build' / 'test-temp'
        temp_base.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=temp_base) as temp, patch.object(gui, 'is_admin', return_value=True), \
                patch.object(gui, 'resource_check', return_value={'BM5235ECBridge.exe': Path('bridge')}):
            assert Path(temp).resolve().is_relative_to(temp_base.resolve())
            events = queue.Queue()
            with patch.object(lighting, 'execute', side_effect=TimeoutError('EC timeout')) as backend:
                gui.run_lighting_operation('lighting_rgb', (1, 2, 3), None, Path(temp), events)
            self.assertEqual(backend.call_count, 1)
            kind, failure = events.get_nowait()
            self.assertEqual(kind, 'event')
            self.assertFalse(failure['automatic_retry'])
            _, result = events.get_nowait()
            self.assertFalse(result.success)
            self.assertIn('EC timeout', result.log_path.read_text(encoding='utf-8'))


if __name__ == '__main__':
    unittest.main()
