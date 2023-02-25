cd "%~dp0custom_textures\gems"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0dependencies/superfreq.exe" png2tex "%~dp0custom_textures\gems/%%G" "%~dp0%%~nG.png_xbox" --platform x360 --miloVersion 25
cd "%~dp0"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0dependencies/swap_rb_art_bytes.py" "%~dp0%%G" "%~dp0%%~nG.png_ps3"