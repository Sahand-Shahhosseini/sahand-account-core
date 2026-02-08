param(
  [Parameter(Mandatory=$true)][string]$logPath
)
$ErrorActionPreference="Stop"

function Fail([string]$msg){
  Write-Host ("FAIL: " + $msg)
  exit 1
}
if(!(Test-Path $logPath)){ Fail "Log file not found: $logPath" }

$log = Get-Content $logPath -Raw

if($log -match "! LaTeX Error:"){ Fail "LaTeX Error present" }
if($log -match "Fatal error occurred"){ Fail "Fatal TeX error" }
if($log -match "Missing character:"){ Fail "Missing character (tofu risk)" }
if($log -match "Font substitution"){ Fail "Font substitution detected" }
if($log -match "Font shape .* not available"){ Fail "Font shape not available" }

# Overfull: strict default (any overfull fails)
$over = (Select-String -Path $logPath -Pattern "Overfull \\hbox").Count
if($over -gt 0){ Fail "Overfull hbox detected ($over)" }

exit 0
