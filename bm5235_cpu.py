"""CPU settings through the OEM MICommonInterface ACPI/SMU path.

Raw EC access here is READ ONLY. Writes use FB00/1700 WMI requests, whose
firmware methods call ALIB/SMU. Importing this module never accesses hardware.
"""
import base64
import json
import os
from pathlib import Path
import subprocess

import bm5235_battery as battery
from bm5235_lighting import SUPPORTED_VERSIONS


OPERATIONS = {"cpu_read", "cpu_apply", "cpu_restore"}
CPU_ADDRESSES = frozenset((0x84E4, 0x84F0, 0x84F3, 0x84F4, 0x84F6, 0x84F7, 0x84F8,
                           0x848E, 0x848F))
# Factory THMP tables: CPUT 09 uses up to 101/120 W; 05/07 up to 76/120 W.
# All inspected factory temperature profiles use 95 C. These are UI bounds,
# not a promise of effective SMU limits under every platform condition.
CPU_MAX_SUSTAINED = {0x05: 76, 0x07: 76, 0x09: 101}
MIN_POWER, MAX_SUSTAINED, MAX_FAST = 5, 101, 120
MIN_TEMP, MAX_TEMP = 40, 95


WMI_SCRIPT = r"""
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
try {
    $taskJson = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('__TASK_B64__'))
    $actions = ConvertFrom-Json $taskJson
    $actions = @($actions)
    if ($actions.Count -lt 1 -or $actions.Count -gt 12) { throw 'Invalid CPU action count' }
    foreach ($action in $actions) {
        switch ($action.op) {
            'query' { if ($null -ne $action.expect -and $action.expect -notin @(0,1)) { throw 'Invalid mode expectation' } }
            'enable' { }
            'disable' { }
            'sustained' { if ($action.value -lt 5 -or $action.value -gt 101) { throw 'Invalid sustained power' } }
            'fast' { if ($action.value -lt 5 -or $action.value -gt 120) { throw 'Invalid fast power' } }
            'temperature' { if ($action.value -lt 40 -or $action.value -gt 95) { throw 'Invalid temperature limit' } }
            'profile' { if ($action.value -notin @(0,1,2)) { throw 'Invalid stock profile' } }
            default { throw 'Unsupported CPU WMI action' }
        }
    }
    $class = Get-CimClass -Namespace root/wmi -ClassName MICommonInterface
    if ($class.CimClassQualifiers['Guid'].Value -ine '{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}') {
        throw 'Unexpected OEM WMI provider GUID'
    }
    $instances = @(Get-CimInstance -Namespace root/wmi -ClassName MICommonInterface |
        Where-Object { $_.Active -ne $false })
    if ($instances.Count -ne 1) { throw 'Expected one active OEM WMI interface' }
    $completed = @()
    foreach ($action in $actions) {
        $data = [byte[]]::new(32)
        $data[1] = 0xFB
        $data[3] = 0x17
        switch ($action.op) {
            'query' { $data[1] = 0xFA }
            'enable' { $data[4] = 1 }
            'disable' { $data[4] = 0 }
            'sustained' { $data[4] = 2; $data[5] = [byte]$action.value }
            'fast' { $data[4] = 3; $data[5] = [byte]$action.value }
            'temperature' { $data[4] = 4; $data[5] = [byte]$action.value }
            'profile' { $data[3] = 8; $data[4] = [byte]$action.value }
        }
        $reply = Invoke-CimMethod -InputObject $instances[0] -MethodName MiInterface -Arguments @{InData=$data}
        $bytes = [byte[]]$reply.OutData
        if ($bytes.Length -lt 6) { throw 'OEM WMI response is too short' }
        $status = [int]$bytes[0] -bor ([int]$bytes[1] -shl 8)
        $function = [int]$bytes[2] -bor ([int]$bytes[3] -shl 8)
        $expectedFunction = [int]$data[2] -bor ([int]$data[3] -shl 8)
        if ($status -ne 0x8000 -or $function -ne $expectedFunction) {
            throw ('OEM WMI response rejected: status={0:X4}, function={1:X4}' -f $status,$function)
        }
        $mode = [int]$bytes[4] -bor ([int]$bytes[5] -shl 8)
        $completed += [ordered]@{op=$action.op; value=$action.value; status=$status; function=$function; mode=$mode}
        if ($action.op -eq 'query') {
            if ($mode -notin @(0,1)) { throw 'OEM WMI returned an unknown custom mode' }
            if ($null -ne $action.expect -and $mode -ne [int]$action.expect) {
                throw 'OEM custom mode did not reach the requested state'
            }
        }
    }
    $result = [ordered]@{ok=$true; completed=$completed}
} catch {
    $result = [ordered]@{ok=$false; error=$_.Exception.Message; completed=@($completed)}
}
$json = $result | ConvertTo-Json -Compress -Depth 5
[Console]::WriteLine([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($json)))
"""


def integer(value, label, low, high):
    try:
        value = int(str(value))
    except (ValueError, TypeError):
        raise ValueError(f"{label}请输入 {low}–{high} 的整数。") from None
    if not low <= value <= high:
        raise ValueError(f"{label}请输入 {low}–{high} 的整数。")
    return value


def validate_settings(sustained, fast, temperature, cpu_type=None):
    maximum = CPU_MAX_SUSTAINED.get(cpu_type, MAX_SUSTAINED)
    sustained = integer(sustained, "持续功耗（W）", MIN_POWER, maximum)
    fast = integer(fast, "快速功耗（W）", MIN_POWER, MAX_FAST)
    temperature = integer(temperature, "温度上限（℃）", MIN_TEMP, MAX_TEMP)
    if sustained > fast:
        raise ValueError("快速功耗需要大于或等于持续功耗。")
    return {"sustained_w": sustained, "fast_w": fast, "temperature_c": temperature}


class CpuReadEC(battery.EC):
    def read(self, address):
        if address in CPU_ADDRESSES:
            return self.transact(0x92, (address >> 8, address & 255), True)
        return super().read(address)

    def mailbox_write(self, *_):
        raise ValueError("CPU profile uses OEM WMI; raw EC writes are not allowed")


def read_snapshot(bridge):
    ports = battery.NativeBridgePorts(bridge, allow_writes=False)
    try:
        ec = CpuReadEC(ports)
        version = tuple(ec.read(a) for a in range(0x8410, 0x8414))
        if version not in SUPPORTED_VERSIONS:
            raise RuntimeError("CPU 控制不支持当前 EC 版本：" + ".".join(f"{v:02X}" for v in version))
        values = {a: ec.read(a) for a in sorted(CPU_ADDRESSES | {0x8460})}
        return {"version": list(version), "custom_enabled": bool(values[0x84F0] & 0x80),
                "cpu_type": values[0x84F3], "profile": values[0x84E4], "saved_profile": values[0x84F4],
                "ac": bool(values[0x8460] & 1), "adapter_w": values[0x848E] * 256 + values[0x848F],
                "sustained_w": values[0x84F6], "fast_w": values[0x84F7], "temperature_c": values[0x84F8],
                "raw": {f"{a:04X}": f"{v:02X}" for a, v in values.items()}}
    finally:
        ports.close()


def run_wmi(actions):
    # Payload is encoded JSON, never interpolated as shell syntax. Each action
    # also has a whitelist and bounds check in the fixed PowerShell script.
    payload = base64.b64encode(json.dumps(actions, separators=(",", ":")).encode()).decode('ascii')
    script = WMI_SCRIPT.replace('__TASK_B64__', payload)
    encoded = base64.b64encode(script.encode('utf-16le')).decode('ascii')
    shell = Path(os.environ.get('SystemRoot', r'C:\Windows')) / 'System32/WindowsPowerShell/v1.0/powershell.exe'
    mutating = any(action.get('op') != 'query' for action in actions)
    uncertain = "；部分参数可能已改变，请读取状态或恢复原厂档位。" if mutating else "；未提交 CPU 调整命令。"
    try:
        process = subprocess.run([str(shell), '-NoProfile', '-NonInteractive', '-EncodedCommand', encoded],
                                 capture_output=True, encoding='utf-8', timeout=30,
                                 creationflags=subprocess.CREATE_NO_WINDOW)
    except subprocess.TimeoutExpired:
        raise RuntimeError("CPU 原厂接口通信超时" + uncertain) from None
    try:
        result = json.loads(base64.b64decode(process.stdout.strip(), validate=True).decode('utf-8'))
    except (ValueError, UnicodeError):
        raise RuntimeError("CPU 原厂接口未返回有效结果，请查看操作日志并重新读取状态。") from None
    if not isinstance(result, dict):
        raise RuntimeError("CPU 原厂接口返回格式异常" + uncertain)
    battery.emit({"phase": "cpu_wmi_result", "wmi": result})
    if process.returncode or result.get('ok') is not True:
        raise RuntimeError("CPU 原厂接口操作未完成：" + result.get('error', '未知错误')
                           + uncertain)
    completed = result.get('completed')
    if not isinstance(completed, list) or len(completed) != len(actions):
        raise RuntimeError("CPU 原厂接口操作记录不完整" + uncertain)
    for action, reply in zip(actions, completed):
        expected_function = 0x0800 if action['op'] == 'profile' else 0x1700
        if reply.get('op') != action['op'] or reply.get('status') != 0x8000 or reply.get('function') != expected_function:
            raise RuntimeError("CPU 原厂接口回包与请求不一致" + uncertain)
        if action['op'] == 'query' and (reply.get('mode') not in (0, 1) or
                                      ('expect' in action and reply['mode'] != action['expect'])):
            raise RuntimeError("CPU 自定义模式查询与请求不一致" + uncertain)
    return result


def _verify_mode(snapshot):
    run_wmi([{"op": "query", "expect": int(snapshot['custom_enabled'])}])


def execute(operation, bridge, settings=None):
    if operation not in OPERATIONS:
        raise ValueError("未知 CPU 操作")
    if operation == 'cpu_apply':
        if not isinstance(settings, dict):
            raise ValueError("请填写 CPU 功耗和温度参数。")
        settings = validate_settings(settings.get('sustained_w'), settings.get('fast_w'), settings.get('temperature_c'))
    with battery.SingleInstance():
        before = read_snapshot(bridge)
        battery.emit({"phase": "cpu_before", "cpu": before})
        _verify_mode(before)
        if operation == 'cpu_read':
            after = before
        elif operation == 'cpu_apply':
            if before['cpu_type'] not in CPU_MAX_SUSTAINED:
                raise RuntimeError("尚未确认当前 CPU 类别的原厂功耗策略，未提交设置。")
            settings = validate_settings(settings['sustained_w'], settings['fast_w'], settings['temperature_c'], before['cpu_type'])
            if not before['ac'] or before['adapter_w'] <= 200:
                raise RuntimeError("原厂自定义模式要求插电且适配器额定功率大于 200W，未提交设置。")
            targets = [{"op": "temperature", "value": settings['temperature_c']},
                       {"op": "sustained", "value": settings['sustained_w']},
                       {"op": "fast", "value": settings['fast_w']}]
            actions = []
            if not before['custom_enabled']:
                # Initialize the three caches before enabling: COMM may consume
                # them on a firmware event. Enabling reapplies a stock profile,
                # so the parameter setters must run again AFTER enable as well.
                actions.extend(targets)
                actions.extend([{"op": "enable"}, {"op": "query", "expect": 1}])
            actions.extend(targets)
            actions.append({"op": "query", "expect": 1})
            run_wmi(actions)
            after = read_snapshot(bridge)
            if not after['custom_enabled'] or any(after[key] != value for key, value in settings.items()):
                raise RuntimeError("CPU 自定义状态或设置值回读不一致；请读取状态或恢复原厂档位。")
        else:
            profile = before['saved_profile'] if before['custom_enabled'] else before['profile']
            if profile not in (0, 1, 2):
                raise RuntimeError("原厂档位未知，未发送恢复命令。")
            # Reapply the stock profile even when CMEN was already off: a
            # partially completed parameter preparation may have called SMU.
            run_wmi([{"op": "disable"}, {"op": "profile", "value": profile},
                     {"op": "query", "expect": 0}])
            after = read_snapshot(bridge)
            if after['custom_enabled']:
                raise RuntimeError("未确认退出 CPU 自定义模式，请重新读取状态。")
        battery.emit({"phase": "cpu_complete", "cpu_operation": operation, "cpu": after,
                      "oem_interface_confirmed": True, "requested_settings_readback_confirmed": True,
                      "effective_smu_limits_measured": False})
        return after
