@echo off
setlocal EnableDelayedExpansion

set "d=prod_wd10ezex"
set "f=prod_wd3200aaks"

rem disk zalohovaci
set "g=prod_wd2500ks"

taskkill /F /IM revoSleep.exe /T >nul 2>&1

rem no arguments given
if "%*" == "" (
    call :spinup %d%
    call :spinup %f%
    call :spinup %g%
)


:parse_arguments
if "%1" == "" goto :continue
set "arg=%1"
set pos=0
:next_char
    set "char=!arg:~%pos%,1!"
    echo !char! | findstr /I /R /C:[dfg] >nul
    if !errorlevel! equ 0 (
        for /F %%I IN ("!char!") do call :spinup !%%I!
    )
    set /a pos=pos+1
if not "!char!" == "" goto :next_char
shift
goto :parse_arguments

:continue
taskkill /F /IM revoSleep.exe /T >nul 2>&1
exit /b

:disable_timeout
    powercfg /x disk-timeout-ac 0
exit /b

:enable_timeout
    powercfg /x disk-timeout-ac 15
exit /b

:spinup
    call :disable_timeout
    revosleep -w %~1
    timeout /T 5 >nul
    call :enable_timeout
exit /b