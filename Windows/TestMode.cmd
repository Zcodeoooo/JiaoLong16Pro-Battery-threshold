@echo off
setlocal
set "PYTHONUTF8=1"
rem Controlled MODE-only experiment at idle/full SOC; stops then restores.
rem Run this CMD from an administrator PowerShell. It does not elevate itself.
set "probePython=C:\Users\48069\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if not exist "%probePython%" (
  echo Python runtime not found. Use your Python 3 to run verify_live.py.
  exit /b 1
)
"%probePython%" "%~dp0..\verify_live.py" --test-stop-and-restore --allow-idle > "%~dp0..\mode_test.jsonl" 2>&1
set "probeResult=%ERRORLEVEL%"
type "%~dp0..\mode_test.jsonl"
exit /b %probeResult%
