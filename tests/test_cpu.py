"""CPU policy tests use fixtures only; never invoke EC drivers or live WMI."""
import base64
import json
from pathlib import Path
import queue
import subprocess
import tempfile
import tkinter as tk
import unittest
from unittest.mock import patch, Mock

import battery_gui as gui
import bm5235_cpu as cpu


def snapshot(**extra):
    return {"version": [0, 0x28, 0, 0], "custom_enabled": False, "cpu_type": 9,
            "profile": 2, "saved_profile": 0, "ac": True, "adapter_w": 280,
            "sustained_w": 45, "fast_w": 65, "temperature_c": 90, **extra}


SETTINGS = {"sustained_w": 45, "fast_w": 65, "temperature_c": 90}


class CpuPolicyTests(unittest.TestCase):
    def test_parameter_limits_types_and_order(self):
        self.assertEqual(cpu.validate_settings('45', '65', '90'), SETTINGS)
        self.assertEqual(cpu.validate_settings(101, 120, 95, 9)['sustained_w'], 101)
        for values in ((0,65,90), (102,120,90), (45,121,90), (45,65,39),
                       (45,65,96), (70,65,90), (True,65,90), ('45.5',65,90)):
            with self.subTest(values=values), self.assertRaises(ValueError):
                cpu.validate_settings(*values)
        with self.assertRaises(ValueError):
            cpu.validate_settings(77, 120, 90, 7)

    def test_read_only_profile_transport_and_version_gate(self):
        values = {0x8410:0,0x8411:0x28,0x8412:0,0x8413:0,0x84F0:0x80,
                  0x84F3:9,0x84F4:2,0x84E4:1,0x848E:1,0x848F:24,
                  0x84F6:45,0x84F7:65,0x84F8:90,0x8460:3}
        with patch.object(cpu.battery, 'NativeBridgePorts') as ports, patch.object(cpu, 'CpuReadEC') as ec:
            ec.return_value.read.side_effect = values.__getitem__
            data = cpu.read_snapshot('bridge')
        ports.assert_called_once_with('bridge', allow_writes=False)
        ports.return_value.close.assert_called_once()
        self.assertTrue(data['custom_enabled'])
        self.assertEqual(data['adapter_w'], 280)
        self.assertEqual(data['temperature_c'], 90)
        with self.assertRaises(ValueError):
            cpu.CpuReadEC(None).mailbox_write(0x84F6, 50)

    def test_read_never_submits_wmi_setters(self):
        with patch.object(cpu.battery, 'SingleInstance'), patch.object(cpu.battery, 'emit'), \
                patch.object(cpu, 'read_snapshot', return_value=snapshot()), patch.object(cpu, 'run_wmi') as wmi:
            cpu.execute('cpu_read', 'bridge')
        wmi.assert_called_once_with([{'op':'query','expect':0}])

    def test_enable_prepares_parameters_then_reapplies_after_stock_reset(self):
        with patch.object(cpu.battery, 'SingleInstance'), patch.object(cpu.battery, 'emit'), \
                patch.object(cpu, 'read_snapshot', side_effect=[snapshot(), snapshot(custom_enabled=True)]), \
                patch.object(cpu, 'run_wmi') as wmi:
            cpu.execute('cpu_apply', 'bridge', SETTINGS)
        actions = wmi.call_args.args[0]
        self.assertEqual([a['op'] for a in actions], ['temperature','sustained','fast','enable','query',
                                                     'temperature','sustained','fast','query'])
        self.assertEqual([a['value'] for a in actions if a['op']=='temperature'], [90,90])
        self.assertEqual(actions[-1], {'op':'query','expect':1})

    def test_active_mode_updates_without_overwriting_saved_stock_profile(self):
        with patch.object(cpu.battery, 'SingleInstance'), patch.object(cpu.battery, 'emit'), \
                patch.object(cpu, 'read_snapshot', return_value=snapshot(custom_enabled=True)), \
                patch.object(cpu, 'run_wmi') as wmi:
            cpu.execute('cpu_apply', 'bridge', SETTINGS)
        self.assertEqual([a['op'] for a in wmi.call_args.args[0]], ['temperature','sustained','fast','query'])

    def test_supply_and_unknown_cpu_rejected_without_mutating_calls(self):
        for data in (snapshot(ac=False), snapshot(adapter_w=200), snapshot(cpu_type=0xFF)):
            with self.subTest(data=data), patch.object(cpu.battery, 'SingleInstance'), \
                    patch.object(cpu.battery, 'emit'), patch.object(cpu, 'read_snapshot', return_value=data), \
                    patch.object(cpu, 'run_wmi') as wmi:
                with self.assertRaises(RuntimeError):cpu.execute('cpu_apply','bridge',SETTINGS)
                wmi.assert_called_once_with([{'op':'query','expect':0}])

    def test_readback_mismatch_is_not_success_and_not_retried(self):
        with patch.object(cpu.battery, 'SingleInstance'), patch.object(cpu.battery, 'emit'), \
                patch.object(cpu, 'read_snapshot', side_effect=[snapshot(),snapshot(custom_enabled=True,fast_w=50)]), \
                patch.object(cpu, 'run_wmi') as wmi:
            with self.assertRaisesRegex(RuntimeError,'回读不一致'):
                cpu.execute('cpu_apply','bridge',SETTINGS)
        self.assertEqual(wmi.call_count,2)  # one read preflight, one bounded mutation plan

    def test_restore_handles_active_mode_and_partial_preparation_while_off(self):
        for active in (False,True):
            with self.subTest(active=active), patch.object(cpu.battery,'SingleInstance'), \
                    patch.object(cpu.battery,'emit'), patch.object(cpu,'read_snapshot',side_effect=[
                        snapshot(custom_enabled=active,saved_profile=0),snapshot(profile=0)]), \
                    patch.object(cpu,'run_wmi') as wmi:
                cpu.execute('cpu_restore','bridge')
            self.assertEqual(wmi.call_args.args[0],[{'op':'disable'},
                {'op':'profile','value':0 if active else 2},{'op':'query','expect':0}])


class CpuTransportTests(unittest.TestCase):
    def test_encoded_request_and_verified_response(self):
        completed=[{'op':'query','status':0x8000,'function':0x1700,'mode':0}]
        reply=base64.b64encode(json.dumps({'ok':True,'completed':completed}).encode()).decode()
        with patch.object(cpu.subprocess,'run',return_value=Mock(returncode=0,stdout=reply)) as run, \
                patch.object(cpu.battery,'emit'):
            cpu.run_wmi([{'op':'query','expect':0}])
        args=run.call_args.args[0]
        script=base64.b64decode(args[-1]).decode('utf-16le')
        self.assertIn("-ClassName MICommonInterface",script)
        self.assertIn("-MethodName MiInterface",script)
        self.assertNotIn('__TASK_B64__',script)
        self.assertNotIn('-ExecutionPolicy',args)

    def test_wmi_errors_malformed_or_wrong_headers_never_count_as_success(self):
        cases=[{'ok':False,'error':'denied','completed':[]}, {'ok':True,'completed':[]},
               {'ok':True,'completed':[{'op':'query','status':0xE000,'function':0x1700,'mode':0}]},
               {'ok':True,'completed':[{'op':'query','status':0x8000,'function':0x1700,'mode':1}]}]
        for data in cases:
            reply=base64.b64encode(json.dumps(data).encode()).decode()
            with self.subTest(data=data), patch.object(cpu.subprocess,'run',return_value=Mock(returncode=0,stdout=reply)) as run, \
                    patch.object(cpu.battery,'emit'):
                with self.assertRaises(RuntimeError):cpu.run_wmi([{'op':'query','expect':0}])
                self.assertEqual(run.call_count,1)

    def test_timeout_is_not_retried(self):
        with patch.object(cpu.subprocess,'run',side_effect=subprocess.TimeoutExpired('powershell',30)) as run:
            with self.assertRaisesRegex(RuntimeError,'部分参数'):
                cpu.run_wmi([{'op':'enable'}])
        self.assertEqual(run.call_count,1)


class CpuInterfaceTests(unittest.TestCase):
    def setUp(self):
        self.admin=patch.object(gui,'is_admin',return_value=True)
        self.power=patch.object(gui.battery,'windows_status',return_value={
            'ac':True,'soc':65,'battery_present':True,'charging':False})
        self.backend=patch.object(gui.cpu_control,'execute',side_effect=AssertionError('Unrequested CPU access'))
        self.admin.start();self.power.start();self.backend_mock=self.backend.start()
        self.root=tk.Tk();self.app=gui.BatteryApp(self.root,start_telemetry=False);self.root.update()

    def tearDown(self):
        for token in self.root.tk.splitlist(self.root.tk.call('after','info')):self.root.tk.call('after','cancel',token)
        self.root.destroy();self.backend.stop();self.power.stop();self.admin.stop()

    def test_startup_and_editing_do_not_access_cpu(self):
        self.app.tabs.select(2);self.app.cpu_sustained.set('55');self.app.cpu_temperature.set('85')
        self.backend_mock.assert_not_called()
        self.assertEqual(self.app.cpu_status.get(),'尚未读取 CPU 设置')

    def test_invalid_fields_do_not_block_read_or_restore(self):
        self.app.cpu_sustained.set('bad')
        with patch.object(gui.threading,'Thread') as thread:
            self.app.start_cpu('cpu_apply');thread.assert_not_called()
            self.app.start_cpu('cpu_restore')
        self.assertEqual(thread.call_args.kwargs['args'][:2],('cpu_restore',None))

    def test_cpu_operation_serializes_all_feature_buttons(self):
        self.app._set_busy(True)
        self.assertTrue(all(str(b['state'])=='disabled' for b in self.app.cpu_buttons+self.app.lighting_buttons))
        with patch.object(gui.threading,'Thread') as thread:
            self.app.start_cpu('cpu_apply');self.app.start_lighting('lighting_read');self.app.start('enable')
            thread.assert_not_called()

    def test_read_loads_valid_fields_and_updates_cpu_specific_bound(self):
        self.app._show_cpu(snapshot(cpu_type=7,sustained_w=70,fast_w=100,temperature_c=85),'cpu_read')
        self.assertEqual(self.app.cpu_sustained.get(),'70')
        self.assertEqual(str(self.app.cpu_inputs[0]['to']),'76')
        self.assertIn('00.28.00.00',self.app.cpu_status.get())
        self.app._show_cpu(snapshot(sustained_w=0,fast_w=0,temperature_c=0),'cpu_read')
        self.assertEqual(self.app.cpu_sustained.get(),'70')

    def test_failure_is_visible_in_cpu_page_and_preserves_other_snapshots(self):
        self.app.policy.set('限充60/80');self.app.lighting_status.set('RGB #FF0000')
        self.app._finish(gui.OperationResult('cpu_apply',False,Path('missing.jsonl'),'WMI access denied'))
        self.assertIn('WMI access denied',self.app.cpu_status.get())
        self.assertEqual(self.app.policy.get(),'限充60/80')
        self.assertEqual(self.app.lighting_status.get(),'RGB #FF0000')
        self.assertFalse(self.app.busy)


class CpuWorkerTests(unittest.TestCase):
    def test_invalid_parameters_stop_before_backend(self):
        events=queue.Queue()
        with patch.object(gui,'is_admin',return_value=True),patch.object(gui.cpu_control,'execute') as backend:
            gui.run_cpu_operation('cpu_apply',{'sustained_w':100,'fast_w':50,'temperature_c':90},Path('unused'),events)
        backend.assert_not_called()
        self.assertFalse(events.get_nowait()[1].success)


if __name__=='__main__':unittest.main()
