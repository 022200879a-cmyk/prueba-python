@echo off
cd /d "%~dp0"
where py >nul 2>nul
if errorlevel 1 (set "PYTHON_CMD=python") else (set "PYTHON_CMD=py")
if not exist "venv\Scripts\python.exe" (
    %PYTHON_CMD% -m venv venv
    if errorlevel 1 goto error
)
venv\Scripts\python.exe -m pip install -r requirements.txt
if errorlevel 1 goto error
venv\Scripts\python.exe calculadora.py
venv\Scripts\python.exe -m pytest -v
if errorlevel 1 goto error
echo.
echo Proyecto preparado. Las pruebas pasaron.
pause
exit /b 0
:error
echo.
echo No se pudo completar. Revisa el mensaje anterior y la instalacion de Python.
pause
exit /b 1
