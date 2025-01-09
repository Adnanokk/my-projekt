@echo off
echo Systeminformationen:
echo ---------------------
echo Betriebssystem:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"

echo.
echo CPU-Name:
wmic cpu get name

echo.
echo CPU-Temperatur:
wmic /namespace:\\root\wmi path MSAcpi_ThermalZoneTemperature get CurrentTemperature | findstr /V "CurrentTemperature"
echo (Hinweis: Werte müssen durch 10 geteilt und 273.15 abgezogen werden, um Grad Celsius zu erhalten.)
set /a cputemp_raw=4000
set /a cputemp_celsius=%cputemp_raw% / 10 - 273
echo Beispieltemperatur: %cputemp_celsius%°C

echo.
echo GPU-Information:
wmic path win32_VideoController get Name

echo.
echo RAM-Größe (GB):
for /f "tokens=1 delims=" %%a in ('wmic memorychip get capacity ^| findstr /r "[0-9]"') do set /a totalram=!totalram! + %%a
set /a totalram_gb=%totalram% / 1073741824
echo %totalram_gb% GB RAM installiert

echo.
echo Freier Speicherplatz auf Laufwerk C:
wmic logicaldisk where "DeviceID='C:'" get FreeSpace,Size

echo.
pause
