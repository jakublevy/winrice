@echo off
setlocal

set "pc=4"

if /I "%1" neq "" (
	set "pc=%1"
)

ssh %msuser%@u-pl%pc%.ms.mff.cuni.cz
endlocal
