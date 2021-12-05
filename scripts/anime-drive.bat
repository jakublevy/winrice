@echo off
setlocal

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
    echo "Incorrect parameter %1"
    goto :end
)

:connect
net use z: %AnimeDrivePath% /user:anime "%AnimeDrivePassword%"
exit /b

:disconnect
net use z: /delete
exit /b

:end
exit /b
endlocal