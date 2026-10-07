@echo off
setlocal
set "PYTHONUTF8=1"
set "PYTHONDONTWRITEBYTECODE=1"
rem Continuous 60/80 experiment; inherits administrator privileges.
rem Charging-test evidence is checked before loading the port driver.
set "controlPython=C:\Users\48069\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if not exist "%controlPython%" (
  echo Python runtime not found. Use your Python 3 to run run_control.py.
  exit /b 1
)
echo BM5235 control: resume below 60%%, stop at 80%%, retain state between.
echo Keep this window open. Ctrl+C restores initial policy if transport is healthy.
echo Log: %~dp0..\control.jsonl
"%controlPython%" "%~dp0..\run_control.py" %*
exit /b %ERRORLEVEL%
