del /f "%~dp0_ark\track\spotlight\spotlight.dta"
cd "%~dp0custom_textures\spotlight"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> spotlight.dta
for %%i in (*.png) do @echo "%%~ni">> spotlight.dta
for %%i in (*.jpg) do @echo "%%~ni">> spotlight.dta
move "%~dp0custom_textures\spotlight\spotlight.dta" "%~dp0_ark\track\spotlight\spotlight.dta"
"%~dp0dependencies/sed.exe" -i -e "s/_emissive//g" "%~dp0_ark\track\spotlight\spotlight.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0dependencies/magick/magick.exe" convert "%~dp0custom_textures\spotlight/%%G" "%~dp0custom_textures\spotlight\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0dependencies/magick/magick.exe" convert "%~dp0custom_textures\spotlight/%%G" "%~dp0custom_textures\spotlight\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0dependencies/magick/magick.exe" convert "%~dp0custom_textures\spotlight/%%G" "%~dp0custom_textures\spotlight\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0dependencies/superfreq.exe" png2tex "%~dp0custom_textures\spotlight/%%G" "%~dp0_ark\track\spotlight\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
cd "%~dp0_ark/track/spotlight/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0dependencies/swap_rb_art_bytes.py" "%~dp0_ark/track/spotlight/gen/%%G" "%~dp0_ark/track/spotlight/gen/%%~nG.png_ps3"
