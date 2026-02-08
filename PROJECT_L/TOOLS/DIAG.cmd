@echo off
setlocal
echo ===============================================
echo PROJECT_L DIAG (local)
echo ===============================================
echo.
echo [1] Checking latexmk...
where latexmk
echo.
echo [2] Checking lualatex...
where lualatex
echo.
echo If missing: install MiKTeX or TeXLive (LuaLaTeX enabled).
echo.
pause
