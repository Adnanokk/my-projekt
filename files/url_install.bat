@echo off
echo Geben Sie die URL der Datei ein, die heruntergeladen werden soll:
set /p url=URL: 
echo Geben Sie den Zielpfad ein (z. B. C:\Users\%USERNAME%\Downloads\file.exe):
set /p target=Pfad: 
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%target%'"
echo Download abgeschlossen.
pause
