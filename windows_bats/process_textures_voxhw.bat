del /f "%~dp0..\_ark\track\voxhw\voxhw.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\voxhw"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> voxhw.dta
for %%i in (*.png) do @echo "%%~ni">> voxhw.dta
for %%i in (*.jpg) do @echo "%%~ni">> voxhw.dta
move "%~dp0..\custom_textures\voxhw\voxhw.dta" "%~dp0..\_ark\track\voxhw\voxhw.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/vocal_bg_//g" "%~dp0..\_ark\track\voxhw\voxhw.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\voxhw/%%G" "%~dp0..\custom_textures\voxhw\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\voxhw/%%G" "%~dp0..\custom_textures\voxhw\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\voxhw/%%G" "%~dp0..\_ark\track\voxhw\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\voxhw/%%G" "%~dp0..\_ark\track\voxhw\gen\%%~nG.png_wii" --platform wii
del sed* /a /s
cd "%~dp0..\_ark/track/voxhw/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track/voxhw/gen/%%G" "%~dp0..\_ark/track/voxhw/gen/%%~nG.png_ps3"
cd "%~dp0..\custom_textures\voxhw"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\voxhw/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track\voxhw\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q