@echo off
REM set "Params=%*"
REM cd /d "%~dp0" && ( if exist "%Temp%\getadmin.vbs" del "%Temp%\getadmin.vbs") && fsutil dirty query %SystemDrive% 1>nul 2>nul || ( echo set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %Params%", "", "runas", 1 >> "%Temp%\getadmin.vbs" && "%Temp%\getadmin.vbs" && Exit /b)
REM %WinDir%\System32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || ( echo. & echo  ERROR: This Batch file MUST be run in an ELEVATED cmd prompt [ Administrator ] & echo. & echo         Right-Click the Batch file and click ^<Run as Administrator^>. & echo. & echo ^>Press ANY key to EXIT . . . & pause >nul & Exit )

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
exit /b

:destination
set /p destination="Destino: [38;2;147;151;155m"
REM set /p destination=Destino: [38;2;57;255;20m
exit /b

:transfer
call powershell -Command "Copy-Item -Path '%origin%' -Destination '%destination%' -Recurse"
exit /b

:exit
exit