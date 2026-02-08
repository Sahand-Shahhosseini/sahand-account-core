@echo off
setlocal

REM Adjust these paths if you build a different doc:
set LOG=DOCS\DOC00_TEMPLATE\main.log

powershell -ExecutionPolicy Bypass -File TOOLS\log_sieve.ps1 -logPath "%LOG%"
if errorlevel 1 exit /b 1

powershell -ExecutionPolicy Bypass -File TOOLS\qa_emit.ps1 -pass 1 -logPath "%LOG%"
if errorlevel 1 exit /b 1

endlocal
exit /b 0
