mkdir "%~dp0..\_tmp"
cd "..\custom_textures/logo"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\logo/%%G" "%~dp0..\custom_textures\logo\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\logo/%%G" "%~dp0..\custom_textures\logo\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/superfreq.exe" png2tex "%~dp0..\custom_textures\logo/%%G" "%~dp0..\_ark\track\logo\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/superfreq.exe" png2tex "%~dp0..\custom_textures\logo/%%G" "%~dp0..\_ark\track\logo\gen\%%~nG.png_wii" --platform wii
del sed* /a /s
cd "%~dp0..\_ark/track/logo/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track/logo/gen/%%G" "%~dp0..\_ark/track/logo/gen/%%~nG.png_ps3"
cd "%~dp0..\custom_textures/logo"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/superfreq.exe" png2tex "%~dp0..\custom_textures\logo/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track\logo\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q