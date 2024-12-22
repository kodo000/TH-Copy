@echo off

title Copy by Technical Home

:start
call :banner
call :menu

:banner
chcp 65001 > nul
echo.
echo.
echo              [38;2;204;153;255m██████╗ ██████╗ ██████╗ ██╗   ██╗[0m
echo             [38;2;153;102;255m██╔════╝██╔═══██╗██╔══██╗╚██╗ ██╔╝[0m
echo             [38;2;102;51;255m██║     ██║   ██║██████╔╝ ╚████╔╝[0m
echo             [38;2;51;204;255m██║     ██║   ██║██╔═══╝   ╚██╔╝[0m
echo             [38;2;0;204;255m╚██████╗╚██████╔╝██║        ██║[0m
echo              [38;2;0;255;204m╚═════╝ ╚═════╝ ╚═╝        ╚═╝[0m
echo.
echo                  Technical Home — 2024    
echo.

exit /b

:menu
call :origin
call :destination
call :transfer

goto :exit

:origin
set /p origin="Origen: [38;2;147;151;155m"
REM set /p origin=Origen: [38;2;57;255;20m

if not exist "%origin%" (
	echo [38;2;255;0;0mLa ruta de origen solicitada no existe. Presione enter para reintentar[0m
	pause > nul
	goto :origin
)

exit /b

:destination
set /p destination="[0mDestino: [38;2;147;151;155m"[0m
REM set /p destination=Destino: [38;2;57;255;20m
exit /b

:transfer
call powershell -Command "Copy-Item -Path '%origin%' -Destination '%destination%' -Recurse"
exit /b

:exit
exit