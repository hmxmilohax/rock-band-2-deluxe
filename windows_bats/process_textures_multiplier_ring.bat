del /f "%~dp0..\_ark\track\multiplier_ring\multiplier_ring.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\multiplier_ring"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> multiplier_ring.dta
for %%i in (*.png) do @echo "%%~ni">> multiplier_ring.dta
for %%i in (*.jpg) do @echo "%%~ni">> multiplier_ring.dta
move "%~dp0..\custom_textures\multiplier_ring\multiplier_ring.dta" "%~dp0..\_ark\track\multiplier_ring\multiplier_ring.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/multiplier_cap_glass_vox_//g" "%~dp0..\_ark\track\multiplier_ring\multiplier_ring.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/multiplier_meter_//g" "%~dp0..\_ark\track\multiplier_ring\multiplier_ring.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/glow_//g" "%~dp0..\_ark\track\multiplier_ring\multiplier_ring.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/solid_//g" "%~dp0..\_ark\track\multiplier_ring\multiplier_ring.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\multiplier_ring/%%G" "%~dp0..\custom_textures\multiplier_ring\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\multiplier_ring/%%G" "%~dp0..\custom_textures\multiplier_ring\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\multiplier_ring/%%G" "%~dp0..\custom_textures\multiplier_ring\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\multiplier_ring/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track\multiplier_ring\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q