@echo off
setlocal

for /f "tokens=2,3 delims=\" %%a in ("%AnimeDrivePath%") do ( set "pt=%%a" )
for /f "tokens=2,3 delims=@" %%b in ("%pt%") do ( set "dst=%%b" )
ssh yadari@%dst% -p %SrvSshPort%
endlocal
