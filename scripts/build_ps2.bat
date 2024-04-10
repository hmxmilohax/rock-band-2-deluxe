cd "%~dp0.."
del >nul 2>&1 /s /q obj\ps2\*.dtb
python dependencies\python\configure_build.py ps2
dependencies\windows\ninja
if %errorlevel% neq 0 (pause /b %errorlevel% && exit /b %errorlevel%)

if not defined rpcs3_path (
    start "" "%~dp0..\out\ps2"
)