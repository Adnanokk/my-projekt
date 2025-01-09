@echo off
rem Dieses Skript leert den Cache- und Temp-Ordner

rem Cache-Ordner leeren
echo Leere Cache-Ordner...
del /q /s "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*"
del /q /s "%LOCALAPPDATA%\Temp\*"

echo Leere spezifischen Temp-Ordner...
del /q /s "C:\Users\adnan\AppData\Local\Temp\*"

rem Temp-Ordner leeren
echo Leere Temp-Ordner...
del /q /s "C:\Windows\Temp\*"
del /q /s "C:\Users\%USERNAME%\AppData\Local\Temp\*"

echo Vorgang abgeschlossen.
pause
