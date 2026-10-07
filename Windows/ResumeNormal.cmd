@echo off
setlocal
set "PYTHONUTF8=1"
set "PYTHONDONTWRITEBYTECODE=1"
rem Explicit restore of known normal/stop modes only. No automatic elevation.
set "controlPython=C:\Users\48069\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if not exist "%controlPython%" (
  echo Python runtime not found. Use your Python 3 to run bm5235_battery.py resume.
  exit /b 1
)
"%controlPython%" "%~dp0..\bm5235_battery.py" resume --board BM5235 --bridge "%~dp0BM5235ECBridge.exe" --experimental-raw-io --enable-write
exit /b %ERRORLEVEL%
