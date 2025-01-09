@echo off
title Automator - by me
chcp 65001 >nul

:: Aktiviert ANSI-Farben, falls noch nicht aktiviert
reg query HKCU\Console | find "VirtualTerminalLevel" >nul 2>&1 || (
    reg add HKCU\Console /f /v VirtualTerminalLevel /t REG_DWORD /d 1 >nul
)

:: Hinweis in Rot anzeigen
echo.
echo [91mIMPORTANT START AS A ADMIN FOR IT TO WORK BETTER[0m
echo.
pause

:: Skript startet ab hier
cd /d "%~dp0files" || (echo Fehler: Ordner 'files' konnte nicht gefunden werden! & pause & exit /b)

:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo     (1) windows activate      (7) system info         (13) virusscan
echo     (2) close all             (8) wifi info
echo     (3) discord               (9) passwd gen
echo     (4) server                (10) install from url
echo     (5) temp and catch        (11) tiktakto
echo     (6) shutdown              (12) mrt
echo.

set /p input=.%BS%

:: Nutze absolute Pfade für die Batch-Dateien
if /I %input% EQU 1 start "" "%~dp0files\activate.bat"
if /I %input% EQU 2 start "" "%~dp0files\closeall.bat"
if /I %input% EQU 3 start "" "%~dp0files\discord.bat"
if /I %input% EQU 4 start "" "%~dp0files\server.bat"
if /I %input% EQU 5 start "" "%~dp0files\temp and catch.bat"
if /I %input% EQU 6 start "" "%~dp0files\shutdown.bat"
if /I %input% EQU 7 start "" "%~dp0files\systeminfo.bat"
if /I %input% EQU 8 start "" "%~dp0files\wifiinfo.bat"
if /I %input% EQU 9 start "" "%~dp0files\password_gen.bat"
if /I %input% EQU 10 start "" "%~dp0files\url_install.bat"
if /I %input% EQU 11 start "" "%~dp0files\tiktakto.bat"
if /I %input% EQU 12 start "" "%~dp0files\mrt.bat"
if /I %input% EQU 13 start "" "%~dp0files\virusscan.bat"

cls
goto start
pause

:banner
echo.
echo.
echo      █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗ ██████╗ ██████╗ 
echo     ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
echo     ███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ██║   ██║██████╔╝
echo     ██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██║   ██║██╔══██╗
echo     ██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ╚██████╔╝██║  ██║
echo     ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
echo.                                                                                   
echo.

pause
