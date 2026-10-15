@echo off
setlocal
set "PYTHONUTF8=1"
set "PYTHONDONTWRITEBYTECODE=1"
call "%~dp0ResolvePython.cmd"
if errorlevel 1 exit /b 1
echo Native 60/80: configure once, observe briefly, then EC keeps control.
echo Default initialization requires SOC below the upper limit.
"%nativePython%" %nativePythonArgs% "%~dp0..\bm5235_native.py" enable --board BM5235 --experimental-raw-io --enable-write --log-file "%~dp0..\native_enable.jsonl" %*
exit /b %ERRORLEVEL%
