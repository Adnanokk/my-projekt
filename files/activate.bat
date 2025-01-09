@echo off
rem Dieses Skript führt direkt ein Remote-Skript aus

powershell -Command "iwr -useb https://get.activated.win | iex"

echo Skript wurde ausgeführt.
pause
