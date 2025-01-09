@echo off
if exist "%windir%\system32\MRT.exe" (
    echo MRT wird gestartet...
    start "" "%windir%\system32\MRT.exe"
) else (
    echo MRT ist auf diesem System nicht verfügbar.
)
pause
