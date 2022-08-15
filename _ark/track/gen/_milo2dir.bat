FOR /F "tokens=*" %%G IN ('dir /b *.milo_xbox') DO superfreq milo2dir "%%G" "unpack\%%~nG" --platform x360 --miloVersion 25 --convertTextures --bigEndian
