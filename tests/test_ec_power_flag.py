"""Simulated EC only: never open the bridge or access physical hardware."""
from pathlib import Path
import unittest
from unittest.mock import patch

import ec_power_flag as flag


class FakeEC:
    def __init__(self, value=0, version=(0, 0x23, 0, 0)):
        self.value, self.version = value, version
        self.command, self.subcommand, self.result = 0, 0, 0x55
        self.poisoned = False
        self.writes = []
        self.concurrent_change = 0
        self.stuck = False
        self.ignore_command = False

    def read(self, address):
        return {0x8150: self.command, 0x8151: self.subcommand, 0x8152: self.result}[address]

    def flag_snapshot(self):
        return {"version": list(self.version), "raw": f"{self.value:02X}",
                "bit4": int(bool(self.value & 0x10)), "mailbox_command": self.command}

    def mailbox_write(self, address, value):
        self.writes.append((address, value))
        if address == 0x8151:
            self.subcommand = value
            # An unrelated firmware-owned flag changes after the host read.
            self.value ^= self.concurrent_change
        else:
            if not self.ignore_command:
                self.value = self.value | 0x10 if self.subcommand == 3 else self.value & 0xEF
            self.command = value if self.stuck else 0


class FlagCommandTests(unittest.TestCase):
    def test_all_byte_values_preserve_the_other_seven_bits(self):
        for before in range(256):
            for desired in (0, 1):
                with self.subTest(before=before, desired=desired):
                    ec = FakeEC(before)
                    after, submitted = flag.set_bit4(ec, desired, ec.flag_snapshot())
                    self.assertEqual(ec.value & 0xEF, before & 0xEF)
                    self.assertEqual(after["bit4"], desired)
                    expected = [] if bool(before & 0x10) == bool(desired) else [
                        (0x8151, 3 if desired else 4), (0x8150, 0xF0)]
                    self.assertEqual(ec.writes, expected)
                    self.assertEqual(submitted, bool(expected))

    def test_firmware_setter_preserves_a_concurrent_unrelated_change(self):
        ec = FakeEC(0x05)
        ec.concurrent_change = 0x80
        after, _ = flag.set_bit4(ec, 1, ec.flag_snapshot())
        self.assertEqual(after["raw"], "95")

    # def test_busy_or_unknown_firmware_rejected_before_any_write(self):
    #     for ec in (FakeEC(version=(0, 0x99, 0, 0)), FakeEC()):
    #         if ec.version[1] == 0x23:
    #             ec.command = 0x10
    #         with self.assertRaises(RuntimeError):
    #             flag.set_bit4(ec, 1, ec.flag_snapshot())
    #         self.assertEqual(ec.writes, [])

    def test_invalid_bit_values_never_write(self):
        for value in (-1, 2, 0x10, True, "1", None):
            ec = FakeEC()
            with self.assertRaises(ValueError):
                flag.set_bit4(ec, value, ec.flag_snapshot())
            self.assertEqual(ec.writes, [])

    def test_timeout_poisons_without_retry_or_rollback(self):
        ec = FakeEC()
        ec.stuck = True
        with patch.object(flag.time, "monotonic", side_effect=[0, 4]), self.assertRaises(TimeoutError):
            flag.set_bit4(ec, 1, ec.flag_snapshot())
        self.assertTrue(ec.poisoned)
        self.assertEqual(ec.writes, [(0x8151, 3), (0x8150, 0xF0)])

    def test_failure_ack_and_readback_mismatch_do_not_retry(self):
        for missing_ack in (True, False):
            ec = FakeEC()
            if missing_ack:
                ec.result = 0xAA
            else:
                ec.ignore_command = True
            with self.assertRaises(RuntimeError):
                flag.set_bit4(ec, 1, ec.flag_snapshot())
            self.assertTrue(ec.poisoned)
            self.assertEqual(ec.writes, [(0x8151, 3), (0x8150, 0xF0)])

    def test_transport_exposes_only_the_flag_mailbox_not_a_whole_byte_write(self):
        ec = flag.PowerFlagEC(None)
        with patch.object(ec, "transact") as transact:
            ec.read(0x83C1)
            transact.assert_called_once_with(0x92, (0x83, 0xC1), True)
            for address, value in ((0x83C1, 0), (0x83C1, 0x10), (0x8150, 0x10), (0x8151, 0x0F)):
                with self.assertRaises(ValueError):
                    ec.mailbox_write(address, value)


class FlagExecutionTests(unittest.TestCase):
    def test_read_does_not_enable_writes_and_always_closes_bridge(self):
        with patch.object(flag.battery, "SingleInstance"), \
                patch.object(flag.battery, "NativeBridgePorts") as ports, \
                patch.object(flag, "PowerFlagEC") as ec, patch.object(flag.battery, "emit"):
            ec.return_value.flag_snapshot.return_value = FakeEC().flag_snapshot()
            flag.execute("flag_read", Path("bridge.exe"))
        ports.assert_called_once_with(Path("bridge.exe"), allow_writes=False)
        ec.return_value.mailbox_write.assert_not_called()
        ports.return_value.close.assert_called_once()

    def test_setting_enables_writes_and_failure_closes_bridge(self):
        with patch.object(flag.battery, "SingleInstance"), \
                patch.object(flag.battery, "NativeBridgePorts") as ports, \
                patch.object(flag, "PowerFlagEC") as ec, \
                patch.object(flag, "set_bit4", side_effect=TimeoutError("test")), \
                patch.object(flag.battery, "emit"), self.assertRaises(TimeoutError):
            flag.execute("flag_1", "bridge.exe")
        ports.assert_called_once_with(Path("bridge.exe"), allow_writes=True)
        ports.return_value.close.assert_called_once()


if __name__ == "__main__":
    unittest.main()
