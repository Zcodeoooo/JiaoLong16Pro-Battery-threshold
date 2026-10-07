@echo off
setlocal
set "PYTHONUTF8=1"
set "PYTHONDONTWRITEBYTECODE=1"
set "nativePython=C:\Users\48069\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if not exist "%nativePython%" (
  echo Python runtime not found. Use your Python 3 to run bm5235_native.py.
  exit /b 1
)
"%nativePython%" "%~dp0..\bm5235_native.py" inspect --board BM5235 --experimental-raw-io --log-file "%~dp0..\native_inspect.jsonl" --append-log %*
exit /b %ERRORLEVEL%
