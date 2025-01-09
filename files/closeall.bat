@echo off
rem Dieses Skript schließt alle geöffneten Anwendungen

echo Schließe alle Anwendungen...
taskkill /F /FI "STATUS eq RUNNING"

echo Alle Anwendungen wurden geschlossen.
pause
