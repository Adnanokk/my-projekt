@echo off
echo Geben Sie eine URL oder IP-Adresse zum Ping-Test ein:
set /p target=Ziel:
ping %target%
echo.
echo Interne IP-Adresse:
ipconfig | findstr /C:"IPv4"
echo.
echo Externe IP-Adresse wird abgerufen...
powershell -Command "(Invoke-WebRequest -Uri 'https://api.ipify.org').Content"
echo.
pause
