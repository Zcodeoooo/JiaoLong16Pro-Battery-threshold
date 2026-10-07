"""Read Windows BatteryStatus through CIM; never loads an EC port driver.

Values are battery/ACPI reports, not an independent electrical measurement.
Keep the raw values and reject unknown/negative rates instead of treating them
as zero. Failure to query telemetry does not authorize any EC write.
"""
import base64
import json
import os
from pathlib import Path
import subprocess


QUERY = r"""
$ErrorActionPreference = 'Stop'
try {
    $cells = @(Get-CimInstance -Namespace root/wmi -ClassName BatteryStatus |
        Select-Object InstanceName,PowerOnline,Charging,Discharging,ChargeRate,DischargeRate,RemainingCapacity,Voltage)
    $json = [ordered]@{available=($cells.Count -gt 0); batteries=$cells} | ConvertTo-Json -Compress -Depth 4
} catch {
    $json = [ordered]@{available=$false; error=$_.Exception.Message; batteries=@()} | ConvertTo-Json -Compress
}
[Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($json))
"""


def sample():
    try:
        shell = Path(os.environ.get("SystemRoot", r"C:\Windows")) / "System32/WindowsPowerShell/v1.0/powershell.exe"
        result = subprocess.run([str(shell), "-NoProfile", "-NonInteractive", "-Command", QUERY],
                                capture_output=True, encoding="utf-8", timeout=8,
                                creationflags=subprocess.CREATE_NO_WINDOW)
        if result.returncode:
            raise RuntimeError(result.stderr.strip() or f"CIM query exited {result.returncode}")
        data = json.loads(base64.b64decode(result.stdout.strip(), validate=True).decode("utf-8"))
        if not isinstance(data, dict) or not isinstance(data.get("batteries"), list):
            raise ValueError("Unexpected BatteryStatus result")
        return data
    except Exception as error:
        return {"available": False, "error": str(error), "batteries": []}


def known_rate(value):
    # Rate is LONG; negative values and the 0x80000000/0xFFFFFFFF sentinels
    # are not usable positive rates. Raw values remain present in the log.
    return isinstance(value, int) and not isinstance(value, bool) and 0 <= value < 0x7FFFFFFF


def index_cells(data):
    if not data.get("available"):
        return {}
    cells = data.get("batteries", [])
    if not cells or any(not isinstance(c.get("InstanceName"), str) for c in cells):
        return {}
    return {c["InstanceName"]: c for c in cells}


def rate_transition(before, stopped, after):
    """True/False when comparable reports exist, otherwise None (unknown)."""
    first, last = index_cells(before), index_cells(after)
    middle = [index_cells(s) for s in stopped]
    if not first or set(first) != set(last) or not middle or any(set(m) != set(first) for m in middle):
        return None
    selected = [name for name, c in first.items() if c.get("Charging") is True
                and known_rate(c.get("ChargeRate")) and c["ChargeRate"] > 0]
    if not selected:
        return None
    for name in selected:
        samples = [m[name] for m in middle] + [last[name]]
        if any(not known_rate(c.get("ChargeRate")) or not known_rate(c.get("DischargeRate")) for c in samples):
            return None
        if not all(m[name].get("PowerOnline") is True and m[name].get("Charging") is False
                   and m[name].get("Discharging") is False and m[name]["ChargeRate"] == 0
                   and m[name]["DischargeRate"] == 0 for m in middle):
            return False
        restored = last[name]
        if not (restored.get("PowerOnline") is True and restored.get("Charging") is True
                and restored.get("Discharging") is False and restored["ChargeRate"] > 0):
            return False
    return True
