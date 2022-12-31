@echo off
cd ..\..
echo Pulling latest Rock Band 2 Deluxe commit...
echo.
git pull https://github.com/hmxmilohax/rock-band-2-deluxe main
echo.
echo Building Rock Band 2 Deluxe for PS3...
echo.
call dependencies\dev_bats\_build_ps3_nopull.bat
echo.
echo Building Rock Band 2 Deluxe for Xbox 360...
echo.
call dependencies\dev_bats\_build_xbox_nopull.bat
pause