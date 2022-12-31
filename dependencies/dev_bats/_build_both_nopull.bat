@echo off
cd ..\..
echo Building Rock Band 2 Deluxe for PS3...
echo.
call dependencies\dev_bats\_build_ps3_nopull.bat
echo.
echo Building Rock Band 2 Deluxe for Xbox 360...
echo.
call dependencies\dev_bats\_build_xbox_nopull.bat
pause