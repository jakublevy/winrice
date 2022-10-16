@echo off
setlocal

for /f "tokens=1,2 delims=\" %%a in ("%KodiDrivePath2%") do ( set "dst=%%a" )
ssh yadari@%dst% -p %SrvSshPort%
endlocal
