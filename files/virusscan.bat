@echo off
:menu
cls
echo ================================
echo          Diagnose-Tool
echo ================================
echo [1] Schneller Virenscan (Windows Defender)
echo [2] Vollständiger Virenscan (Windows Defender)
echo [3] Systemprobleme scannen und reparieren (SFC/DISM)
echo [4] Antivirus-Scan (ClamAV)
echo [5] Beenden
echo ================================
set /p choice=Wählen Sie eine Option: 

if "%choice%"=="1" goto quick_scan
if "%choice%"=="2" goto full_scan
if "%choice%"=="3" goto system_check
if "%choice%"=="4" goto clamav_scan
if "%choice%"=="5" exit
goto menu

:quick_scan
echo Starte schnellen Windows Defender Scan...
cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -Scan -ScanType 1
pause
goto menu

:full_scan
echo Starte vollständigen Windows Defender Scan...
cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -Scan -ScanType 2
pause
goto menu

:system_check
echo Überprüfen und Reparieren von Systemdateien...
sfc /scannow
echo Überprüfung abgeschlossen.
echo Repariere Windows-Komponentenstore...
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto menu

:clamav_scan
echo Starte ClamAV-Scan...
"C:\Pfad\zu\clamdscan.exe" --recursive --remove C:\
pause
goto menu
