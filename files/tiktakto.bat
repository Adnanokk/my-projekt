@echo off
setlocal EnableDelayedExpansion

set "win=" & set "out="
for %%a in (1:2:3 4:5:6 7:8:9  1:4:7 2:5:8 3:6:9  1:5:9 3:5:7) do (
   for /F "tokens=1-3 delims=:" %%x in ("%%a") do (
      set "win=!win! ^!pos[%%x]^!^!pos[%%y]^!^!pos[%%z]^!"
      if "!out:~-3,1!" neq "9" set "out=!out!$^!pos[%%x]^! ^^| ^!pos[%%y]^! ^^| ^!pos[%%z]^!"
   )
)
set "out=!out:~1!"

:menu
cls
set /P "player[X]=Enter player 1 (X) name: "
set /P "player[O]=Enter player 2 (O) name: "

for /L %%i in (1,1,9) do set "pos[%%i]=%%i"
set "options=123456789" & set "filler=asdfghjkl"

for %%n in (X O X O X O X O X) do (
   cls
   echo/& echo/& echo     %out:$=& echo     --+---+--& echo     %& echo/& echo/
   choice /C !options! /N /M "!player[%%n]!, it's your turn: "
   for /F "tokens=1,2" %%e in ("!errorlevel! !filler:~0,1!") do (
      set "options=!options:%%e=%%f!" & set "filler=!filler:~1!" & set "pos[%%e]=%%n"
   )
   set "line=%win%"
   if "!line:%%n%%n%%n=!" neq "!line!" echo You win^^^! & goto nextGame
)
echo Game was a draw...
:nextGame
echo/
pause
goto :menu