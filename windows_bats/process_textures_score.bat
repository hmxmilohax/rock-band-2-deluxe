del /f "%~dp0..\_ark\track\score\score.dta"
mkdir "%~dp0..\_tmp"
cd "%~dp0..\custom_textures\score"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> score.dta
for %%i in (*.png) do @echo "%%~ni">> score.dta
for %%i in (*.jpg) do @echo "%%~ni">> score.dta
move "%~dp0..\custom_textures\score\score.dta" "%~dp0..\_ark\track\score\score.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/indv_player_meter_//g" "%~dp0..\_ark\track\score\score.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/circle_//g" "%~dp0..\_ark\track\score\score.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/glass_//g" "%~dp0..\_ark\track\score\score.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/glow_//g" "%~dp0..\_ark\track\score\score.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\score/%%G" "%~dp0..\custom_textures\score\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\score/%%G" "%~dp0..\custom_textures\score\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\score/%%G" "%~dp0..\_ark\track\score\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq_wii.exe" png2tex "%~dp0..\custom_textures\score/%%G" "%~dp0..\_ark\track\score\gen\%%~nG.png_wii" --platform wii --miloVersion 25
del sed* /a /s
cd "%~dp0..\_ark/track/score/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track/score/gen/%%G" "%~dp0..\_ark/track/score/gen/%%~nG.png_ps3"
cd "%~dp0..\custom_textures\score"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\score/%%G" "%~dp0..\_tmp\%%~nG.bmp_ps2"
cd "%~dp0..\_tmp"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp_ps2') DO "%~dp0..\dependencies/windows/superfreq.exe" tex2png "%~dp0..\_tmp/%%G" "%~dp0..\_tmp\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\_tmp/%%G" "%~dp0..\_ark\track\score\gen\%%~nG.png_ps2"
cd "%~dp0..\"
rmdir "%~dp0..\_tmp" /s /q