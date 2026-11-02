param([string]$Python = 'python')
$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    & $Python -c "import struct, PyInstaller, tkinter; assert struct.calcsize('P') == 8, 'Build using 64-bit Windows Python'"
    if ($LASTEXITCODE -ne 0) { throw 'Need 64-bit Windows Python with tkinter and PyInstaller (pip install -r requirements-build.txt).' }
    & $Python -m unittest discover -s tests -v
    if ($LASTEXITCODE -ne 0) { throw 'GUI tests failed.' }
    # Smoke-test the same payload with a diagnostic asInvoker manifest, so
    # unattended builds do not leave a UAC prompt waiting on the desktop.
    $previousDiagnostic = $env:BATTERY_THRESHOLD_DIAGNOSTIC_BUILD
    try {
        $env:BATTERY_THRESHOLD_DIAGNOSTIC_BUILD = '1'
        & $Python -m PyInstaller --noconfirm BatteryThreshold.spec
        if ($LASTEXITCODE -ne 0) { throw 'Diagnostic packaging failed.' }
    } finally {
        $env:BATTERY_THRESHOLD_DIAGNOSTIC_BUILD = $previousDiagnostic
    }
    $report = Join-Path $PSScriptRoot 'build\package-check.json'
    $checkExe = Join-Path $PSScriptRoot 'build\check-runtime\BatteryThresholdCheck.exe'
    New-Item -ItemType Directory -Path (Split-Path -Parent $checkExe) -Force | Out-Null
    Move-Item -LiteralPath (Join-Path $PSScriptRoot 'dist\BatteryThresholdCheck.exe') -Destination $checkExe -Force
    # A windowed executable needs an explicit wait in PowerShell. This check
    # only reads Windows battery status, never initializes the EC driver.
    if (Test-Path -LiteralPath $report) { Remove-Item -LiteralPath $report }
    $check = Start-Process -FilePath $checkExe -ArgumentList @('--check-package', ('"' + $report + '"')) -WindowStyle Hidden -Wait -PassThru
    if ($check.ExitCode -ne 0) { throw "Runtime check failed. See $report" }
    $result = Get-Content -LiteralPath $report -Raw -Encoding UTF8 | ConvertFrom-Json
    if (-not $result.ui_ready -or -not $result.frozen) { throw "Invalid runtime report: $report" }
    $exePath = Join-Path $PSScriptRoot 'dist\BatteryThreshold.exe'
    & $Python tools\verify_package.py $exePath $checkExe
    if ($LASTEXITCODE -ne 0) { throw 'Manifest or payload verification failed.' }
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'GUI_README.md') -Destination (Join-Path $PSScriptRoot 'dist\使用说明.md')
    Write-Output "Built and checked: $exePath"
} finally {
    Pop-Location
}
