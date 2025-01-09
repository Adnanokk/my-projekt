@echo off
rem Dieses Skript startet Discord oder installiert es nach Bestätigung, falls es nicht vorhanden ist.

rem Überprüfen, ob die Discord-Datei existiert
if exist "C:\Users\%USERNAME%\AppData\Local\Discord\Update.exe" (
    rem Discord starten
    start "" "C:\Users\%USERNAME%\AppData\Local\Discord\Update.exe" --processStart Discord.exe
    echo Discord wurde gestartet.
) else (
    echo Discord ist nicht installiert.
    echo Möchten Sie Discord jetzt herunterladen und installieren? [J/N]
    set /p choice=Eingabe: 
    if /i "%choice%"=="J" (
        echo Discord wird heruntergeladen und installiert...
        rem Discord-Setup herunterladen
        powershell -Command "Invoke-WebRequest -Uri https://discord.com/api/download?platform=win -OutFile %temp%\DiscordSetup.exe"
        echo Download abgeschlossen.
        rem Setup ausführen
        start "" "%temp%\DiscordSetup.exe"
        echo Discord-Setup wurde gestartet. Bitte folgen Sie den Anweisungen.
    ) else (
        echo Installation abgebrochen. Discord wird nicht installiert.
    )
)

pause
