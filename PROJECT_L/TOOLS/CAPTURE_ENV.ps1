$ErrorActionPreference = "Stop"
$ts = Get-Date -Format "yyyyMMdd_HHmmss"
$outDir = "ANNEX"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$path = Join-Path $outDir ("ENV_CAPTURE_" + $ts + ".txt")

"Timestamp: $ts" | Out-File -Encoding utf8 $path
"OS: $([Environment]::OSVersion)" | Out-File -Append -Encoding utf8 $path
"PowerShell: $($PSVersionTable.PSVersion)" | Out-File -Append -Encoding utf8 $path
"PATH: $env:Path" | Out-File -Append -Encoding utf8 $path
try { latexmk -v | Out-File -Append -Encoding utf8 $path } catch { "latexmk not found" | Out-File -Append -Encoding utf8 $path }
try { lualatex --version | Out-File -Append -Encoding utf8 $path } catch { "lualatex not found" | Out-File -Append -Encoding utf8 $path }
