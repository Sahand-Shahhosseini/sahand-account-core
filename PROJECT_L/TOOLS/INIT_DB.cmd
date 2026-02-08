@echo off
setlocal
python DB\init_registry.py
if errorlevel 1 exit /b 1
echo OK: DB initialized
endlocal
