del /f "%~dp0_ark\track\streak\streak.dta"
cd "%~dp0custom_textures\streak"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> streak.dta
for %%i in (*.png) do @echo "%%~ni">> streak.dta
for %%i in (*.jpg) do @echo "%%~ni">> streak.dta
move "%~dp0custom_textures\streak\streak.dta" "%~dp0_ark\track\streak\streak.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0dependencies/magick/magick.exe" convert "%~dp0custom_textures\streak/%%G" -resize 512x512! "%~dp0custom_textures\streak\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0dependencies/magick/magick.exe" convert "%~dp0custom_textures\streak/%%G" -resize 512x512! "%~dp0custom_textures\streak\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0dependencies/magick/magick.exe" convert "%~dp0custom_textures\streak/%%G" -resize 512x512! "%~dp0custom_textures\streak\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0dependencies/superfreq.exe" png2tex "%~dp0custom_textures\streak/%%G" "%~dp0_ark\track\streak\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
cd "%~dp0_ark/track/streak/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0dependencies/swap_rb_art_bytes.py" "%~dp0_ark/track/streak/gen/%%G" "%~dp0_ark/track/streak/gen/%%~nG.png_ps3"