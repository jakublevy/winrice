@echo off

for %%I in (.) do set "_drive_=%%~dI"
for %%I in (.) do set "_currdir_=%%~nxI"
for %%I in (.) do set "_currpath_=%%~fI"

if defined _currdir_ (
	if "%_drive_%\%_currdir_%" neq "%_currpath_%" (
		rem make prompt shorter
		set "_shortcurrpath_=%_drive_%\...\%_currdir_%"
	) else (
		rem current currpath is drive letter\folder (no need to shorten it)
		set "_shortcurrpath_=%_currpath_%"
	)
) else (
	rem current currpath is only drive letter, e.g. C:
	set "_shortcurrpath_=%_currpath_%"
)

rem for /F %%I in ('hostname') do set "host=%%I"

rem set prompt
rem prompt [%username%@%computername% %shortcurrpath%]$G$S
prompt %_shortcurrpath_%$G$S
