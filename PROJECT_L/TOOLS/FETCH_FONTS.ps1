param(
  [string]$Dest = "$PSScriptRoot\..\STYLEKIT\fonts"
)

$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path $Dest | Out-Null

Write-Host "Downloading open fonts into: $Dest"

function DownloadFile($url, $outPath) {
  Write-Host "GET $url"
  Invoke-WebRequest -Uri $url -OutFile $outPath
}

# NOTE: These are upstream project pages. For deterministic pinning, download specific release assets and record SHA256.
# Vazirmatn upstream releases:
# https://github.com/rastikerdar/vazirmatn/releases
# Libertinus upstream releases:
# https://github.com/alerque/libertinus/releases
# STIX Two upstream releases:
# https://github.com/stipub/stixfonts/releases

Write-Host ""
Write-Host "Manual step (recommended): download release zips from upstream and copy these files into STYLEKIT/fonts:"
Write-Host " - LibertinusSerif-Regular.otf / Bold / Italic / BoldItalic"
Write-Host " - STIXTwoMath-Regular.otf (or STIX2Math.otf if you adjust the class)"
Write-Host " - Vazirmatn-Regular.ttf / Vazirmatn-Bold.ttf"
Write-Host ""
Write-Host "Why manual? Upstream asset names change; we keep the script safe and deterministic (no guessing)."
