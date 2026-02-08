@echo off
setlocal enabledelayedexpansion

REM === User-configurable ===
set DOC=DOCS\DOC00_TEMPLATE\main.tex

REM === Capture env ===
powershell -ExecutionPolicy Bypass -File TOOLS\CAPTURE_ENV.ps1

REM === Build (requires latexmk in PATH; MiKTeX provides it) ===
latexmk -r TOOLS\latexmkrc -cd %DOC%
if errorlevel 1 (
  echo BUILD FAILED
  exit /b 1
)

REM === QA ===
call TOOLS\QA_PDF.cmd
if errorlevel 1 (
  echo QA FAILED
  exit /b 1
)

REM === Release ===
call TOOLS\MAKE_RELEASE.cmd
if errorlevel 1 (
  echo RELEASE FAILED
  exit /b 1
)

echo PASS: Build + QA + Release complete.
endlocal
