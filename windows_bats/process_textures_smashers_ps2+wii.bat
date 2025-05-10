del /f "%~dp0..\_ark\track_og\smashers\smashers.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\smashers_ps2"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> smashers.dta
for %%i in (*.png) do @echo "%%~ni">> smashers.dta
for %%i in (*.jpg) do @echo "%%~ni">> smashers.dta
move "%~dp0..\custom_textures\smashers_ps2\smashers.dta" "%~dp0..\_ark\track_og\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/square_smasher_bright_//g" "%~dp0..\_ark\track_og\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/smasher_//g" "%~dp0..\_ark\track_og\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/color_//g" "%~dp0..\_ark\track_og\smashers\smashers.dta"
del sed* /a /s
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\smashers_ps2/%%G" "%~dp0..\custom_textures\smashers_ps2\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\smashers_ps2/%%G" "%~dp0..\custom_textures\smashers_ps2\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\smashers_ps2/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq_wii.exe" png2tex "%~dp0..\custom_textures\smashers_ps2/%%G" "%~dp0..\_ark\track_og\smashers\gen\%%~nG.png_wii" --platform wii --miloVersion 25
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track_og\smashers\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q