@echo off
setlocal EnableDelayedExpansion

set "olddir=%cd%"
set "upstream=https://raw.githubusercontent.com/lptstr/winfetch/master/winfetch.ps1"

cd /d %chocolateyinstall%\lib\winfetch\tools
bitsadmin /transfer "Downloading winfetch.ps1" /priority FOREGROUND "%upstream%" "%cd%\_winfetch.ps1" >nul
if exist "winfetch.ps1" (
    for /F "usebackq" %%I in (`certutil -hashfile "winfetch.ps1" SHA256 ^| find /V " "`) do set "oldhash=%%I"
    for /F "usebackq" %%I in (`certutil -hashfile "_winfetch.ps1" SHA256 ^| find /V " "`) do set "newhash=%%I"
    if "!oldhash!" == "!newhash!" (
        echo winfetch.ps1 is already the most recent.
    ) else (
        move /Y "_winfetch.ps1" "winfetch.ps1" >nul
        echo winfetch.ps1 was updated from master.
    )
)
cd /d "%olddir%"