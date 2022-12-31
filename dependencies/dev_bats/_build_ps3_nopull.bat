rem git pull https://github.com/hmxmilohax/rock-band-2-deluxe main
rem @echo off
echo:
echo:Temporarily moving Xbox files out of the ark path to reduce final ARK size
%SystemRoot%\System32\robocopy.exe "%~dp0..\..\_ark" "%~dp0..\..\_temp\_ark" *.milo_xbox /S /MOVE /XD "%~dp0..\..\_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
%SystemRoot%\System32\robocopy.exe "%~dp0..\..\_ark" "%~dp0..\..\_temp\_ark" *.png_xbox /S /MOVE /XD "%~dp0..\..\_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
%SystemRoot%\System32\robocopy.exe "%~dp0..\..\_ark" "%~dp0..\..\_temp\_ark" *.bmp_xbox /S /MOVE /XD "%~dp0..\..\_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
echo:
echo:Building PS3 ARK
"%~dp0..\..\dependencies/arkhelper" dir2ark "%~dp0..\..\_ark" "%~dp0..\..\_build\ps3\USRDIR\gen" -n "patch_ps3" -e -v 5
echo:
echo:Moving back Xbox files
echo:
%SystemRoot%\System32\robocopy.exe "%~dp0..\..\_temp\_ark" "%~dp0..\..\_ark" *.milo_xbox /S /MOVE /XD "%~dp0..\..\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
%SystemRoot%\System32\robocopy.exe "%~dp0..\..\_temp\_ark" "%~dp0..\..\_ark" *.png_xbox /S /MOVE /XD "%~dp0..\..\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
%SystemRoot%\System32\robocopy.exe "%~dp0..\..\_temp\_ark" "%~dp0..\..\_ark" *.bmp_xbox /S /MOVE /XD "%~dp0..\..\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
rd _temp
echo:Successfully built Rock Band 2 Deluxe ARK. You may find the files needed to place on your PS3 in /_build/PS3/
rem pause