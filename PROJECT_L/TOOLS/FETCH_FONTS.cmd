@echo off
setlocal
powershell -ExecutionPolicy Bypass -File "%~dp0FETCH_FONTS.ps1"
echo.
echo DONE. Place the required font files in PROJECT_L\STYLEKIT\fonts then rebuild.
pause
