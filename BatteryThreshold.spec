# Build: python -m PyInstaller --noconfirm BatteryThreshold.spec
from pathlib import Path
import os

root = Path(SPECPATH)
# Optionally produce a no-EC smoke-check host from the SAME analysis/archive,
# so both manifests wrap byte-for-byte identical Python and resource files.
a = Analysis(
    [str(root / "battery_gui.py")],
    pathex=[str(root)],
    binaries=[],
    datas=[(str(root / "Windows" / name), "Windows") for name in (
        "BM5235ECBridge.exe", "WinRing0x64.dll", "WinRing0x64.sys")],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=["pytest", "unittest", "numpy", "pandas", "matplotlib", "IPython"],
    noarchive=False,
    optimize=1,
)
pyz = PYZ(a.pure)
def executable(name, admin):
    return EXE(
        pyz, a.scripts, a.binaries, a.datas, [],
        name=name,
        debug=False,
        bootloader_ignore_signals=False,
        strip=False,
        upx=False,
        console=False,
        disable_windowed_traceback=False,
        uac_admin=admin,
    )

if os.environ.get("BATTERY_THRESHOLD_DIAGNOSTIC_BUILD") == "1":
    diagnostic = executable("BatteryThresholdCheck", False)
exe = executable("BatteryThreshold", True)
