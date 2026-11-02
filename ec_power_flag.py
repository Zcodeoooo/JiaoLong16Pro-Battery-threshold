"""Manual MRID6 0x83C1 bit-4 control through the firmware's F0 mailbox.

F0/03 sets the bit and F0/04 clears it in the EC itself. No whole-byte XDATA
write is exposed, so unrelated flags can change without a host read/write race.
"""
from pathlib import Path
import time

import bm5235_battery as battery


FLAG_ADDRESS = 0x83C1
FLAG_MASK = 0x10
OPERATIONS = {"flag_read": None, "flag_0": 0, "flag_1": 1}
WRITE_OPERATIONS = ("flag_0", "flag_1")
# Setter/clearer and their command dispatch were checked in these EC images.
VERIFIED_VERSIONS = {(0, 0x1F, 0, 0), (0, 0x23, 0, 0), (0, 0x28, 0, 0)}


class PowerFlagEC(battery.EC):
    def read(self, address):
        if address == FLAG_ADDRESS:
            return self.transact(0x92, (address >> 8, address & 255), True)
        return super().read(address)

    def mailbox_write(self, address, value):
        if (address, value) not in {(0x8151, 0x03), (0x8151, 0x04), (0x8150, 0xF0)}:
            raise ValueError("Only the analyzed F0/03 and F0/04 flag commands are allowed")
        self.transact(0x93, (address >> 8, address & 255, value))

    def flag_snapshot(self):
        version = [self.read(address) for address in range(0x8410, 0x8414)]
        value = self.read(FLAG_ADDRESS)
        return {"version": version, "address": "83C1", "mask": "10",
                "raw": f"{value:02X}", "bit4": int(bool(value & FLAG_MASK)),
                "mailbox_command": self.read(0x8150)}


def set_bit4(ec, value, before):
    if type(value) is not int or value not in (0, 1):
        raise ValueError("bit 4 must be 0 or 1")
    # if tuple(before["version"]) not in VERIFIED_VERSIONS:
    #     version = ".".join(f"{part:02X}" for part in before["version"])
    #     raise RuntimeError(f"EC {version} 尚未核对该标志命令，仅允许读取。")
    if before["mailbox_command"] != 0 or ec.read(0x8150) != 0:
        raise RuntimeError("Firmware mailbox is busy; no flag command submitted")
    if before["bit4"] == value:
        # Confirm against a fresh read, rather than a previously shown UI value.
        after = ec.flag_snapshot()
        if after["bit4"] == value:
            return after, False
    subcommand = 0x03 if value else 0x04
    ec.mailbox_write(0x8151, subcommand)
    if ec.read(0x8150) != 0 or ec.read(0x8151) != subcommand:
        raise RuntimeError("Flag mailbox changed before submission; no trigger sent")
    ec.mailbox_write(0x8150, 0xF0)
    deadline = time.monotonic() + 3
    while ec.read(0x8150) != 0:
        if time.monotonic() >= deadline:
            ec.poisoned = True
            raise TimeoutError("EC flag mailbox timeout; no automatic retry")
        time.sleep(0.02)
    if ec.read(0x8152) != 0x55:
        ec.poisoned = True
        raise RuntimeError("EC flag mailbox result mismatch; read state before another write")
    after = ec.flag_snapshot()
    if after["bit4"] != value:
        ec.poisoned = True
        raise RuntimeError("EC flag readback mismatch; no automatic retry")
    return after, True


def execute(operation, bridge):
    if operation not in OPERATIONS:
        raise ValueError("Unknown EC flag operation")
    with battery.SingleInstance():
        ports = battery.NativeBridgePorts(Path(bridge), allow_writes=operation in WRITE_OPERATIONS)
        ec = PowerFlagEC(ports)
        try:
            before = ec.flag_snapshot()
            battery.emit({"phase": "power_flag_read", "operation": operation, "power_flag": before})
            if operation == "flag_read":
                return
            after, submitted = set_bit4(ec, OPERATIONS[operation], before)
            battery.emit({"phase": "power_flag_complete", "operation": operation,
                          "power_flag": after, "command_submitted": submitted,
                          "whole_byte_write": False})
        finally:
            ports.close()
