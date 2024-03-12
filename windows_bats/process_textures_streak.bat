del /f "%~dp0..\_ark\track_new\streak\streak.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\streak"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> streak.dta
for %%i in (*.png) do @echo "%%~ni">> streak.dta
for %%i in (*.jpg) do @echo "%%~ni">> streak.dta
move "%~dp0..\custom_textures\streak\streak.dta" "%~dp0..\_ark\track_new\streak\streak.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\streak/%%G" "%~dp0..\custom_textures\streak\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\streak/%%G" "%~dp0..\custom_textures\streak\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\streak/%%G" "%~dp0..\_ark\track_new\streak\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\streak/%%G" "%~dp0..\_ark\track_new\streak\gen\%%~nG.png_wii" --platform wii
del sed* /a /s
cd "%~dp0..\_ark/track_new/streak/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track_new/streak/gen/%%G" "%~dp0..\_ark/track_new/streak/gen/%%~nG.png_ps3"