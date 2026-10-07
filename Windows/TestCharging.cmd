@echo off
setlocal
set "PYTHONUTF8=1"
set "PYTHONDONTWRITEBYTECODE=1"
rem Requires AC + SOC 60..79 + currently charging. No automatic elevation.
rem Stops briefly, records BatteryStatus telemetry, restores normal policy.
set "probePython=C:\Users\48069\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if not exist "%probePython%" (
  echo Python runtime not found. Use your Python 3 to run verify_live.py.
  exit /b 1
)
"%probePython%" "%~dp0..\verify_live.py" --test-stop-and-restore > "%~dp0..\charging_test.jsonl" 2>&1
set "probeResult=%ERRORLEVEL%"
type "%~dp0..\charging_test.jsonl"
exit /b %probeResult%
