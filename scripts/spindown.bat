@echo off
setlocal EnableDelayedExpansion

rem no arguments given
if "%*" == "" (
    call :spindown D
    call :spindown F
    call :spindown G
)

:parse_arguments
if "%1" == "" goto :continue
set "arg=%1"
set pos=0
:next_char
    set "char=!arg:~%pos%,1!"
    echo !char! | findstr /I /R /C:[dfg] >nul
    if !errorlevel! equ 0 (
        call :spindown !char!
    )
    set /a pos=pos+1
if not "!char!" == "" goto :next_char
shift
goto :parse_arguments

:continue
exit /b

:spindown
	set "drive=%~1:"
	smartctl -n standby %drive% >nul
	rem !errorlevel! equ 0 ACTIVE or IDLE
	rem !errorlevel! equ 2 STANDBY
	if !errorlevel! equ 0 (
		echo %drive% --^> STANDBY
		smartctl -s standby,now %drive% >nul
	)
exit /b
