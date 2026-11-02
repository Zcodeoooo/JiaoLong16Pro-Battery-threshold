"""EC 00.23 / 00.28 RGB and effect requests through OEM 40/06, 40/07.

Uses the existing EC transport and process mutex. No driver is initialized at
import, and no direct writes to lighting registers or charging flags are used.
"""
import time

import bm5235_battery as battery


# Exact versions only: both mailbox and downstream lighting code were compared
# byte-for-byte in the local 00.23 and 00.28 firmware images.
SUPPORTED_VERSIONS = ((0x00, 0x23, 0x00, 0x00), (0x00, 0x28, 0x00, 0x00))
LIGHTING_ADDRESSES = frozenset(range(0x84E8, 0x84EC))
PARAMETERS = (0x8153, 0x8154, 0x8155)
OPERATIONS = {"lighting_read", "lighting_rgb", "lighting_mode"}


def validate_byte(value, label):
    try:
        value = int(str(value))
    except (ValueError, TypeError):
        raise ValueError(f"{label}需要填写 0–255 的整数。") from None
    if not 0 <= value <= 255:
        raise ValueError(f"{label}需要填写 0–255 的整数。")
    return value


def validate_rgb(values):
    if not isinstance(values, (tuple, list)) or len(values) != 3:
        raise ValueError("请填写 R、G、B 三个颜色值。")
    return tuple(validate_byte(v, label) for v, label in zip(values, ("R", "G", "B")))


class LightingEC(battery.EC):
    def read(self, address):
        if address in LIGHTING_ADDRESSES or address in PARAMETERS:
            return self.transact(0x92, (address >> 8, address & 255), True)
        return super().read(address)

    def mailbox_write(self, address, value):
        if type(value) is not int or not 0 <= value <= 255:
            raise ValueError("Lighting mailbox values must be bytes")
        if not (address in PARAMETERS or (address == 0x8151 and value in (6, 7))
                or (address == 0x8150 and value == 0x40)):
            raise ValueError("Only analyzed RGB / effect mailbox writes are allowed")
        self.transact(0x93, (address >> 8, address & 255, value))


def check_version(ec):
    version = tuple(ec.read(a) for a in range(0x8410, 0x8414))
    if version not in SUPPORTED_VERSIONS:
        current = ".".join(f"{v:02X}" for v in version)
        supported = " / ".join(".".join(f"{v:02X}" for v in row) for row in SUPPORTED_VERSIONS)
        raise RuntimeError(f"灯光功能支持 EC {supported}；当前 EC 为 {current}，操作已停止。")
    return version


def check_idle(ec):
    if ec.read(0x8150) != 0:
        raise RuntimeError("EC 邮箱正忙，本次灯光操作已停止，请稍后手动重试。")


def read_lighting(ec):
    version = check_version(ec)
    check_idle(ec)
    mode = ec.read(0x84E8)
    rgb = tuple(ec.read(a) for a in range(0x84E9, 0x84EC))
    check_idle(ec)
    return {"version": list(version), "mode": mode, "rgb": list(rgb),
            "hex": "#" + "".join(f"{v:02X}" for v in rgb)}


def submit(ec, subcommand, values):
    """Parameters, subcommand, then main trigger; no resend on any failure."""
    if subcommand not in (6, 7) or len(values) != (1 if subcommand == 6 else 3):
        raise ValueError("Invalid lighting command")
    values = tuple(validate_byte(v, "灯光参数") for v in values)
    check_version(ec)
    check_idle(ec)
    for address, value in zip(PARAMETERS, values):
        check_idle(ec)
        ec.mailbox_write(address, value)
    check_idle(ec)
    ec.mailbox_write(0x8151, subcommand)
    check_idle(ec)
    if ec.read(0x8151) != subcommand or any(
            ec.read(address) != value for address, value in zip(PARAMETERS, values)):
        ec.poisoned = True
        raise RuntimeError("灯光参数回读不一致，未触发应用，请重新读取状态。")
    check_idle(ec)
    ec.mailbox_write(0x8150, 0x40)
    deadline = time.monotonic() + 3
    while ec.read(0x8150) != 0:
        if time.monotonic() >= deadline:
            ec.poisoned = True
            raise TimeoutError("Lighting mailbox timeout; no automatic retry")
        time.sleep(0.02)
    if ec.read(0x8152) != 0x55:
        ec.poisoned = True
        raise RuntimeError("灯光命令返回异常，请重新读取状态。")
    after = read_lighting(ec)
    actual = (after["mode"],) if subcommand == 6 else tuple(after["rgb"])
    if actual != values:
        ec.poisoned = True
        raise RuntimeError("灯光设置回读不一致，请重新读取状态。")
    return after


def execute(operation, bridge, rgb=None, mode=None):
    if operation not in OPERATIONS:
        raise ValueError("未知灯光操作")
    if operation == "lighting_rgb":
        rgb = validate_rgb(rgb)
    elif operation == "lighting_mode":
        mode = validate_byte(mode, "灯效模式")
    with battery.SingleInstance():
        ports = battery.NativeBridgePorts(bridge, allow_writes=operation != "lighting_read")
        try:
            ec = LightingEC(ports)
            before = read_lighting(ec)
            battery.emit({"phase": "lighting_before", "lighting": before})
            if operation == "lighting_read":
                after = before
            else:
                after = submit(ec, 7 if operation == "lighting_rgb" else 6,
                               rgb if operation == "lighting_rgb" else (mode,))
            battery.emit({"phase": "lighting_complete", "lighting_operation": operation,
                          "lighting": after, "settings_readback_confirmed": True,
                          "physical_effect_verified": False})
            return after
        finally:
            ports.close()
