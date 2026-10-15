@echo off
rem Called inside the launcher's setlocal; do not load any EC driver here.
set "nativePythonArgs="
set "nativePython=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if exist "%nativePython%" goto check_python
where py.exe >nul 2>&1
if not errorlevel 1 (
  set "nativePython=py.exe"
  set "nativePythonArgs=-3"
  goto check_python
)
where python.exe >nul 2>&1
if errorlevel 1 (
  echo Python 3.10 or later was not found. Install Python or run bm5235_native.py with your Python interpreter.
  exit /b 1
)
set "nativePython=python.exe"
:check_python
"%nativePython%" %nativePythonArgs% -c "import sys; sys.exit(0 if sys.version_info >= (3, 10) else 1)" >nul 2>&1
if errorlevel 1 (
  echo A working Python 3.10 or later is required. No EC driver was loaded.
  exit /b 1
)
exit /b 0
