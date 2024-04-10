@echo off
cd "%~dp0.."
del >nul 2>&1 /s /q obj\ps3\*.dtb
python dependencies\python\configure_build.py ps3
dependencies\windows\ninja
if %errorlevel% neq 0 (pause /b %errorlevel% && exit /b %errorlevel%)

if not defined rpcs3_path (
    start "" "%~dp0..\out\ps3"
    goto :end
)

:end