@echo off
setlocal
set "PYTHONUTF8=1"
set "PYTHONDONTWRITEBYTECODE=1"
call "%~dp0ResolvePython.cmd"
if errorlevel 1 exit /b 1
"%nativePython%" %nativePythonArgs% "%~dp0..\bm5235_native.py" inspect --board BM5235 --experimental-raw-io --log-file "%~dp0..\native_inspect.jsonl" --append-log %*
exit /b %ERRORLEVEL%
