@echo off

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
    if exist z: (
        goto :disconnect
    ) else (
        goto :connect
    )
)

:connect
net use z: %AnimeDrivePath%!%sshport% /user:anime "%AnimeDrivePassword%" /persistent:no
exit /b

:disconnect
net use z: /delete
exit /b

:end
exit /b