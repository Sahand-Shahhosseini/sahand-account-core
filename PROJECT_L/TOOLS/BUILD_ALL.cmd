@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0.."

echo ===============================================
echo PROJECT_L BUILD_ALL (local)
echo Builds all DOCS\*\main.tex using latexmk.
echo ===============================================
echo.

where latexmk >nul 2>nul
if errorlevel 1 (
  echo ERROR: latexmk not found. Install a LaTeX distribution with latexmk.
  pause
  exit /b 1
)

for /d %%D in ("DOCS\*") do (
  if exist "%%D\main.tex" (
    echo ---- Building: %%D\main.tex
    pushd "%%D"
    latexmk -r "..\..\TOOLS\latexmkrc" -cd main.tex
    popd
  )
)

echo.
echo DONE.
pause
