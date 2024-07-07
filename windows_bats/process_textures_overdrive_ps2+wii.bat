del /f "%~dp0..\_ark\track_og\spotlight\spotlight.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\spotlight_ps2"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> spotlight.dta
for %%i in (*.png) do @echo "%%~ni">> spotlight.dta
for %%i in (*.jpg) do @echo "%%~ni">> spotlight.dta
move "%~dp0..\custom_textures\spotlight_ps2\spotlight.dta" "%~dp0..\_ark\track_og\spotlight\spotlight.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\spotlight_ps2/%%G" "%~dp0..\custom_textures\spotlight_ps2\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\spotlight_ps2/%%G" "%~dp0..\custom_textures\spotlight_ps2\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\spotlight_ps2/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\spotlight_ps2/%%G" "%~dp0..\_ark\track_og\spotlight\gen\%%~nG.png_wii" -p wii
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track_og\spotlight\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q