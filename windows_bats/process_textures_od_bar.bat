del /f "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\overdrive_bar"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> overdrive_bar.dta
for %%i in (*.png) do @echo "%%~ni">> overdrive_bar.dta
for %%i in (*.jpg) do @echo "%%~ni">> overdrive_bar.dta
move "%~dp0..\custom_textures\overdrive_bar\overdrive_bar.dta" "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/player_meter_//g" "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/long_//g" "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/background_//g" "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/indv_bar_//g" "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/rising_sun_fx_small_//g" "%~dp0..\_ark\track\overdrive_bar\overdrive_bar.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\overdrive_bar/%%G" "%~dp0..\custom_textures\overdrive_bar\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\overdrive_bar/%%G" "%~dp0..\custom_textures\overdrive_bar\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\overdrive_bar/%%G" "%~dp0..\_ark\track\overdrive_bar\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\overdrive_bar/%%G" "%~dp0..\_ark\track\overdrive_bar\gen\%%~nG.png_wii" --platform wii
del sed* /a /s
cd "%~dp0..\_ark/track/overdrive_bar/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track/overdrive_bar/gen/%%G" "%~dp0..\_ark/track/overdrive_bar/gen/%%~nG.png_ps3"
cd "%~dp0..\custom_textures\overdrive_bar"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\overdrive_bar/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track\overdrive_bar\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q