@echo off

for %%I in (.) do set "drive=%%~dI"
for %%I in (.) do set "currdir=%%~nxI"
for %%I in (.) do set "currpath=%%~fI"

if defined currdir (
	if "%drive%\%currdir%" neq "%currpath%" (
		rem make prompt shorter
		set "shortcurrpath=%drive%\...\%currdir%"
	) else (
		rem current currpath is drive letter\folder (no need to shorten it)
		set "shortcurrpath=%currpath%"
	)
) else (
	rem current currpath is only drive letter, e.g. C:
	set "shortcurrpath=%currpath%"
)

rem for /F %%I in ('hostname') do set "host=%%I"

rem set prompt
rem prompt [%username%@%computername% %shortcurrpath%]$G$S
prompt %shortcurrpath%$G$S
