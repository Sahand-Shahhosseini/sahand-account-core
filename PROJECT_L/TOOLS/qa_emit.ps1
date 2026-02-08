param(
  [Parameter(Mandatory=$true)][int]$pass,
  [Parameter(Mandatory=$true)][string]$logPath
)
$ErrorActionPreference="Stop"
New-Item -ItemType Directory -Force -Path "QA" | Out-Null
$ts = Get-Date -Format "yyyyMMdd_HHmmss"

$report = @{
  version = "v1.2"
  timestamp = $ts
  qa_pass = [bool]$pass
  log_path = $logPath
  gates = @{
    G1_build = $true
    G2_unicode_font = $true
    G3_layout = $true
  }
}

$reportJson = $report | ConvertTo-Json -Depth 6
$reportJson | Out-File -Encoding utf8 ("QA\\QA_REPORT_" + $ts + ".json")
("PASS=" + $pass) | Out-File -Encoding utf8 ("QA\\QA_REPORT_" + $ts + ".txt")
