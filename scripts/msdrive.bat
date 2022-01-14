@echo off
setlocal

if /I "%2" neq "" (
	set "pc=%2"
) else (
	set "pc=4"
)

if /I "%1" equ "/connect" (
    goto :connect
) 
if /I "%1" equ "/c" (
    goto :connect
) 
if /I "%1" equ "/d" (
    goto :disconnect
) 
if /I "%1" equ "/disconnect" (
    goto :disconnect
) else (
    if /I "%1" neq "" (
        set "pc=%1"
    ) 
    if exist y: (
        goto :disconnect
    ) else (
        goto :connect
    )
    goto :end
)

:connect
net use y: \\sshfs\%msuser%@u-pl%pc%.ms.mff.cuni.cz /user:%msuser% "%msuserpassword%" /persistent:no
endlocal
exit /b

:disconnect
net use y: /delete
endlocal
exit /b

:end
endlocal
exit /b