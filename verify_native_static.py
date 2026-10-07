"""Test native configuration against the ORIGINAL 8051 firmware bytes.

This executes actual mailbox/port handlers, switch helper, mode selector,
scheduler and native threshold state machine. SMBus/timing dependencies are
explicit stubs; no physical EC or charger I/O is performed.
"""
import argparse
import hashlib
from pathlib import Path
from unittest.mock import patch
import bm5235_battery as t
import bm5235_native as native
from verify_static import CPU, FirmwarePorts, EXPECTED_SHA256, check


class PeriodicPorts(FirmwarePorts):
    def write(self, port, value):
        super().write(port, value)
        if port == 0x62 and self.cpu.get(0x36) == 0:
            self.cpu.run(0x3EF1)
            if self.cpu.x[0x8370] in (0x31, 0x32):
                self.cpu.run(0x4013)


class RecordingEC(native.NativeEC):
    def __init__(self, ports):
        super().__init__(ports)
        self.submissions = []
    def mailbox_write(self, address, value):
        super().mailbox_write(address, value)
        self.submissions.append((address, value))


def fixture(code, soc=78):
    cpu = CPU(code)
    cpu.run(0xC3E2)
    cpu.x[0x8460], cpu.x[0x847C], cpu.x[0x83F0], cpu.x[0x8370] = 3, soc, 1, 4
    cpu.hooks[0x2DE2] = lambda vm: vm.ram.__setitem__(7, 1)
    cpu.hooks[0x2F68] = lambda vm: vm.ram.__setitem__(7, 0)
    # Native charging state remains active; elapsed-timer helpers are stubbed
    # so the test does not execute unrelated polling/hardware routines.
    def timer_value(vm):
        vm.a, vm.ram[7] = 0, 0
    cpu.hooks[0x4278] = timer_value
    cpu.hooks[0x42B0] = lambda vm: setattr(vm, 'a', 1)
    ec = RecordingEC(PeriodicPorts(cpu))
    def windows():
        return {'ac': bool(cpu.x[0x8460] & 1), 'soc': cpu.x[0x847C],
                'battery_present': bool(cpu.x[0x8460] & 2), 'charging': bool(cpu.x[0x8460] & 4)}
    return cpu, ec, windows


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--ec', required=True)
    args = p.parse_args()
    code = Path(args.ec).read_bytes()
    check(hashlib.sha256(code).hexdigest() == EXPECTED_SHA256, 'original EC hash for native checks')
    cpu, ec, windows = fixture(code)
    with patch.object(t, 'windows_status', side_effect=windows):
        after = native.enable_native(ec)
        check(ec.submissions == [(0x8153, 80), (0x8154, 60), (0x8151, 0x0D), (0x8150, 0x10)],
              'native host writes upper/lower/subcommand then trigger, no internal-state writes')
        check((after['mode'], after['state'], after['native_high'], after['native_low'], after['native_substate'])
              == (0x48, 0x32, 80, 60, 2), 'actual scheduler selects native hold at initial SOC 78')
        check(cpu.x[0x837C:0x837E] == b'\0\0' and (0x2DE2, 1) not in cpu.calls,
              'default native initialization below upper never calls discharge helper with argument 1')
        cpu.x[0x847C] = 60
        check(ec.snapshot()['native_substate'] == 2, 'native lower boundary 60 holds')
        cpu.x[0x847C] = 59
        check(ec.snapshot()['native_substate'] == 3, 'native SOC 59 enters charging state')
        cpu.x[0x847C] = 79
        check(ec.snapshot()['native_substate'] == 3, 'native SOC 79 retains charging state')
        cpu.x[0x847C] = 80
        check(ec.snapshot()['native_substate'] == 2, 'native SOC 80 returns to hold without Windows threshold writes')
        cpu.x[0x847C] = 85
        count = len(ec.submissions)
        native.enable_native(ec)
        check(len(ec.submissions) == count and cpu.x[0x83A0] == 2,
              'identical settled native policy is idempotent even when SOC now exceeds upper')
        cpu.x[0x847C] = 78
        before_calls = len(cpu.calls)
        updated = native.enable_native(ec, low=50, high=85)
        check((updated['native_low'], updated['native_high'], updated['native_substate']) == (50, 85, 2)
              and any(address == 0x4333 for address, _ in cpu.calls[before_calls:]),
              'updating active native policy uses original restore and firmware cleanup before reinitialization')
        restored = native.disable_native(ec)
        check(restored['mode'] == 0 and restored['native_substate'] == 0
              and int(restored['raw']['8395'], 16) & 7 == 0,
              'native disable clears policy and native substate through ORIGINAL firmware cleanup')

    for soc in (80, 85):
        cpu, ec, windows = fixture(code, soc)
        with patch.object(t, 'windows_status', side_effect=windows):
            try:
                native.enable_native(ec)
            except RuntimeError:
                pass
            else:
                raise AssertionError('Expected above/equal-upper initialization refusal')
        check(not ec.submissions and cpu.x[0x83C0] == 0,
              f'default SOC {soc} refusal happens BEFORE all mailbox writes')

    cpu, ec, windows = fixture(code, 85)
    with patch.object(t, 'windows_status', side_effect=windows):
        native.enable_native(ec, allow_initial_discharge=True)
        check((0x2DE2, 1) in cpu.calls and cpu.x[0x83A0] == 1,
              'explicit advanced option preserves original above-upper discharge initialization branch')

    cpu, ec, windows = fixture(code, 59)
    with patch.object(t, 'windows_status', side_effect=windows):
        check(native.enable_native(ec)['native_substate'] == 3,
              'fresh below-lower native initialization enters charge state')
        cpu.x[0x83F0], cpu.x[0x8460] = 0, 2
        check(native.disable_native(ec)['mode'] == 0,
              'explicit native disable also works with AC disconnected when firmware cleanup succeeds')

    for mode in (1, 0x49):
        cpu, ec, windows = fixture(code)
        cpu.x[0x83C0] = mode
        with patch.object(t, 'windows_status', side_effect=windows):
            try: native.enable_native(ec)
            except RuntimeError: pass
            else: raise AssertionError('Competing mode accepted')
        check(not ec.submissions, f'competing native mode {mode:02X} refuses all mailbox writes')
    for address, value in ((0x83A0, 2), (0x83C0, 0x48), (0x8151, 0x0C), (0x8153, 101)):
        try: ec.mailbox_write(address, value)
        except ValueError: pass
        else: raise AssertionError('Disallowed native write accepted')
    check(True, 'native writer rejects internal-state, forced-discharge and invalid parameter writes')
    cpu, ec, windows = fixture(code)
    original_write = ec.mailbox_write
    def soc_changes(address, value):
        original_write(address, value)
        if (address, value) == (0x8151, 0x0D):
            cpu.x[0x847C] = 80
    with patch.object(t, 'windows_status', side_effect=windows), patch.object(ec, 'mailbox_write', side_effect=soc_changes):
        try: native.enable_native(ec)
        except RuntimeError: pass
        else: raise AssertionError('SOC changed to upper before trigger, but command was sent')
    check((0x8150, 0x10) not in ec.submissions and cpu.x[0x83C0] == 0,
          'SOC rising during parameter preparation aborts BEFORE enable trigger')
    cpu, ec, windows = fixture(code, 78)
    with patch.object(t, 'windows_status', side_effect=windows):
        native.enable_native(ec)
        cpu.x[0x83F0], cpu.x[0x8460] = 0, 2
        unplugged = ec.snapshot()
        check(unplugged['mode'] == 0x48 and unplugged['native_substate'] == 0,
              'AC disconnect preserves native mode but ORIGINAL cleanup resets its substate')
        cpu.x[0x83F0], cpu.x[0x8460], cpu.x[0x847C] = 1, 3, 85
        count = len(cpu.calls)
        ec.snapshot()
        check((0x2DE2, 1) in cpu.calls[count:],
              'later AC reconnect above upper reenters ORIGINAL discharge initialization without a Windows command')
    print('Native static checks passed; physical 0D threshold cycle NOT verified by these tests.')


if __name__ == '__main__':
    main()
