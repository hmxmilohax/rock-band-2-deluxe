@echo off
cd "%~dp0.."
del >nul 2>&1 /s /q obj\wii\*.dtb
python dependencies\python\configure_build.py wii
dependencies\windows\ninja
if %errorlevel% neq 0 (pause /b %errorlevel% && exit /b %errorlevel%)

if not defined dolphin_path (
    start "" "%~dp0..\out\wii\files"
    goto :end
)
:end