r"""Offline checks against the ORIGINAL EC bytes; never performs hardware I/O.

Usage: python verify_static.py --ec C:\Users\48069\Desktop\ec.bin
This small 8051 interpreter implements only instructions reached by these tests.
It executes the actual Keil switch helper, not a reconstructed switch table.
SMBus hardware calls are stubbed; passing does NOT verify a physical charger.
"""
import argparse
import hashlib
import json
from pathlib import Path
from unittest.mock import patch
import bm5235_battery as tool

EXPECTED_SHA256 = "7573b2cb494e9a308e2ab13bf5fcb5f90d0d111922e6cfe41487219159993430"


class CPU:
    def __init__(self, code):
        self.code, self.ram, self.sfr, self.x = code, bytearray(256), bytearray(256), bytearray(65536)
        self.sfr[0x81] = 0x70
        self.hooks, self.calls, self.writes = {}, [], []

    def get(self, addr):
        return (self.ram if addr < 128 else self.sfr)[addr]

    def put(self, addr, value):
        (self.ram if addr < 128 else self.sfr)[addr] = value & 255

    @property
    def a(self): return self.sfr[0xE0]
    @a.setter
    def a(self, value): self.sfr[0xE0] = value & 255
    @property
    def c(self): return self.sfr[0xD0] >> 7
    @c.setter
    def c(self, value): self.sfr[0xD0] = (self.sfr[0xD0] & 127) | (bool(value) << 7)
    @property
    def ptr(self): return self.sfr[0x83] << 8 | self.sfr[0x82]
    @ptr.setter
    def ptr(self, value): self.sfr[0x82], self.sfr[0x83] = value & 255, value >> 8 & 255
    def reg(self, n): return ((self.sfr[0xD0] >> 3) & 3) * 8 + n
    def push(self, v):
        self.sfr[0x81] += 1
        self.ram[self.sfr[0x81]] = v
    def pop(self):
        v = self.ram[self.sfr[0x81]]
        self.sfr[0x81] -= 1
        return v
    def byte(self):
        v = self.code[self.pc]
        self.pc += 1
        return v
    def rel(self, v): self.pc = (self.pc + (v if v < 128 else v - 256)) & 65535
    def xwrite(self):
        self.x[self.ptr] = self.a
        self.writes.append((self.ptr, self.a))

    def run(self, address):
        self.pc = address
        self.push(255)
        self.push(255)
        for _ in range(20000):
            if self.pc == 65535:
                return
            at, op = self.pc, self.byte()
            if op == 0x90: self.ptr = self.byte() << 8 | self.byte()
            elif op == 0x74: self.a = self.byte()
            elif op == 0xE4: self.a = 0
            elif op == 0xE0: self.a = self.x[self.ptr]
            elif op == 0xF0: self.xwrite()
            elif op == 0xA3: self.ptr = (self.ptr + 1) & 65535
            elif op == 0x04: self.a += 1
            elif op == 0x14: self.a -= 1
            elif op == 0xE5: self.a = self.get(self.byte())
            elif op == 0xF5: self.put(self.byte(), self.a)
            elif op == 0x75: d, v = self.byte(), self.byte(); self.put(d, v)
            elif op == 0x85: src, dst = self.byte(), self.byte(); self.put(dst, self.get(src))
            elif op == 0xD0: self.put(self.byte(), self.pop())
            elif op == 0x44: self.a |= self.byte()
            elif op == 0x54: self.a &= self.byte()
            elif op == 0x64: self.a ^= self.byte()
            elif op in (0xC3, 0xD3): self.c = op == 0xD3
            elif op == 0x93: self.a = self.code[(self.ptr + self.a) & 65535]
            elif op == 0x73: self.pc = (self.ptr + self.a) & 65535
            elif op in (0x02, 0x12):
                target = self.byte() << 8 | self.byte()
                if op == 0x12:
                    self.calls.append((target, self.ram[self.reg(7)]))
                    if target in self.hooks:
                        self.hooks[target](self)
                        continue
                    self.push(self.pc & 255); self.push(self.pc >> 8)
                self.pc = target
            elif op == 0x22: self.pc = self.pop() << 8 | self.pop()
            elif op in (0x60, 0x70, 0x40, 0x50, 0x80):
                rel = self.byte()
                if {0x60: self.a == 0, 0x70: self.a != 0, 0x40: self.c != 0,
                    0x50: self.c == 0, 0x80: True}[op]: self.rel(rel)
            elif op in (0x24, 0x34, 0x94) or 0x28 <= op <= 0x2F or 0x38 <= op <= 0x3F or 0x98 <= op <= 0x9F:
                value = self.byte() if op in (0x24, 0x34, 0x94) else self.ram[self.reg(op & 7)]
                sub = op == 0x94 or 0x98 <= op <= 0x9F
                carry = self.c if sub or op == 0x34 or 0x38 <= op <= 0x3F else 0
                result = self.a - value - carry if sub else self.a + value + carry
                self.c = result < 0 if sub else result > 255
                self.a = result
            elif 0xE8 <= op <= 0xEF: self.a = self.ram[self.reg(op & 7)]
            elif 0xF8 <= op <= 0xFF: self.ram[self.reg(op & 7)] = self.a
            elif 0x78 <= op <= 0x7F: self.ram[self.reg(op & 7)] = self.byte()
            elif 0xA8 <= op <= 0xAF: self.ram[self.reg(op & 7)] = self.get(self.byte())
            elif 0x88 <= op <= 0x8F: self.put(self.byte(), self.ram[self.reg(op & 7)])
            elif 0x68 <= op <= 0x6F: self.a ^= self.ram[self.reg(op & 7)]
            elif op in (0xE6, 0xE7): self.a = self.ram[self.ram[self.reg(op & 1)]]
            elif op in (0xF6, 0xF7): self.ram[self.ram[self.reg(op & 1)]] = self.a
            elif 0x08 <= op <= 0x0F:
                r = self.reg(op & 7); self.ram[r] = (self.ram[r] + 1) & 255
            elif 0x18 <= op <= 0x1F:
                r = self.reg(op & 7); self.ram[r] = (self.ram[r] - 1) & 255
            else: raise AssertionError(f"Unsupported opcode {op:02X} at {at:04X}")
        raise AssertionError("Instruction budget exceeded")


class FirmwarePorts:
    """Model the host interface with firmware's real command/data handlers."""
    def __init__(self, cpu): self.cpu, self.pending, self.trace = cpu, False, []
    def read(self, port):
        if port == 0x66: return int(self.pending)
        assert self.pending
        self.pending = False
        return self.cpu.x[0x1501]
    def write(self, port, value):
        self.trace.append((port, value))
        c = self.cpu
        if port == 0x66:
            c.put(0x35, value); c.ram[7] = value; c.run(0x09E9)
        else:
            c.put(0x37, value); c.ram[7] = c.get(0x35)
            n = len(c.writes)
            c.run(0x09B6)
            c.put(0x36, c.get(0x36) - 1)
            self.pending = any(a == 0x1501 for a, _ in c.writes[n:])
            if c.x[0x8150]: c.run(0x4AF6)


def check(condition, description):
    if not condition: raise AssertionError(description)
    print("PASS", description)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--ec", required=True)
    args = p.parse_args()
    code = Path(args.ec).read_bytes()
    check(hashlib.sha256(code).hexdigest() == EXPECTED_SHA256, "original EC SHA256")
    c = CPU(code)
    c.run(0xC3E2)
    check(tuple(c.x[0x8410:0x8414]) == tool.EXPECTED_VERSION, "firmware version initialization")
    c.x[0x8460], c.x[0x847C] = 3, 79
    c.x[0x8370], c.x[0x83F0] = 4, 1
    ports = FirmwarePorts(c)
    ec = tool.EC(ports)
    check(ec.read(0x847C) == 79 and ports.trace == [(0x66, 0x92), (0x62, 0x84), (0x62, 0x7C)], "0x92 high-byte-first read through real firmware")
    os_status = {"ac": True, "soc": 79, "battery_present": True}
    with patch.object(tool, "windows_status", return_value=os_status):
        after = tool.set_stopped(ec, True)
        check(after["mode"] == 2 and after["mailbox_command"] == 0 and after["mailbox_result"] == 0x55, "0x93 writes / 0x10-0x0E mailbox / actual switch helper")
        c.run(0x3EF1)
        check(c.x[0x8370] == 0x31, "stop flag selects state 0x31 on AC")
        # No physical SMBus: set hardware helper return values explicitly.
        c.hooks[0x2DE2] = lambda vm: vm.ram.__setitem__(7, 1)
        def charger_stub(vm):
            check(vm.x[0x837C:0x837E] == b"\0\0", "stop routine passes zero requested current to charger writer")
            vm.ram[7] = 0  # zero error count from 0x2F68
        c.hooks[0x2F68] = charger_stub
        c.x[0x837C:0x837E] = b"\x12\x34"
        n = len(c.calls)
        c.run(0x4013)  # execute the ACTUAL scheduler dispatch, not a chosen leaf
        check((0x2DE2, 1) not in c.calls[n:], "complete stop dispatch never enables discharge/LEARN")
        check((0x2DE2, 0) in c.calls, "manual stop calls discharge/LEARN helper with argument 0")
        after = tool.set_stopped(ec, False)
        check(after["mode"] == 0 and after["mailbox_result"] == 0x55, "0x10-0x0F clears stop policy")
    c.x[0x8150], c.x[0x8151] = 0x10, 0xFF
    c.run(0x4AF6)
    check(c.x[0x8152] == 0x55 and c.x[0x83C0] == 0,
          "unknown battery subcommand also returns 0x55: completion alone proves no action")
    c.x[0x8150], c.x[0x8151] = 0x10, 0x0C
    c.run(0x4AF6)
    c.run(0x3EF1)
    n = len(c.calls)
    c.run(0x4013)
    check(c.x[0x8370] == 0x30 and (0x2DE2, 1) in c.calls[n:],
          "0x0C is forced discharge: actual state 0x30 dispatch invokes LEARN=1")
    c.x[0x8150], c.x[0x8151] = 0x10, 0x0F
    c.run(0x4AF6)
    c.x[0x8150], c.x[0x8151], c.x[0x8153], c.x[0x8154] = 0x10, 0x0D, 80, 60
    c.run(0x4AF6)
    check(c.x[0x83C0] == 0x48 and c.x[0x83A1:0x83A3] == bytes([80, 60]),
          "native dual-threshold command stores upper=80 / lower=60")
    c.run(0x3EF1)
    c.run(0x3E09)  # initialize native substate 1
    c.x[0x847C] = 90
    n = len(c.calls)
    c.run(0x3E09)
    check((0x2DE2, 1) in c.calls[n:],
          "native initial SOC > upper invokes discharge/LEARN helper with argument 1")
    c.x[0x83A0], c.x[0x847C] = 2, 60
    c.run(0x3E09)
    check(c.x[0x83A0] == 2, "native lower boundary 60 keeps hold state")
    c.x[0x847C] = 59
    c.run(0x3E09)
    check(c.x[0x83A0] == 3, "native SOC 59 transitions to charge state")
    c.x[0x847C] = 80
    c.run(0x3E09)
    check(c.x[0x83A0] == 2, "native SOC 80 returns from charge to hold state")
    c.x[0x83C0], c.x[0x847C] = 0, 79
    for initial in (False, True):
        check(tool.hysteresis(59, initial) is False and tool.hysteresis(80, initial) is True
              and tool.hysteresis(60, initial) is initial and tool.hysteresis(79, initial) is initial,
              f"60/80 boundary semantics, previous stopped={initial}")
    snapshot = ec.snapshot()
    for changed in ({"version": [0, 0x29, 0, 0]}, {"mode": 1}, {"mode": 0x48}, {"mailbox_command": 0x20}, {"soc": 255}):
        try: tool.validate({**snapshot, **changed}, os_status)
        except RuntimeError: pass
        else: raise AssertionError(f"unsafe profile accepted: {changed}")
    check(True, "wrong version / competing battery mode / busy mailbox / invalid SOC rejected")
    class Busy:
        writes = []
        def read(self, port): return 1
        def write(self, *a): self.writes.append(a)
    b = Busy(); busy = tool.EC(b)
    try: busy.read(0x847C)
    except RuntimeError: pass
    check(not b.writes and busy.poisoned, "pending output aborts before command; no flush/retry")
    print(json.dumps({"result": "static checks passed", "hardware_verified": False}))


if __name__ == "__main__": main()
