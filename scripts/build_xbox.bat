cd "%~dp0.."
del >nul 2>&1 /s /q obj\xbox\*.dtb
python dependencies\python\configure_build.py xbox
dependencies\windows\ninja
if %errorlevel% neq 0 (pause /b %errorlevel% && exit /b %errorlevel%)

if not defined xenia_path (
    start "" "%~dp0..\out\xbox"
)