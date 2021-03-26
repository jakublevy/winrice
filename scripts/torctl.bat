@echo off
setlocal

if /I "%1" equ "/start" (
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /t REG_SZ /d "socks=localhost:9050" /f > nul

	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 1 /f > nul

	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyOverride" /t REG_SZ /d "<local>" /f > nul

	set curpath=%~dp0
	powershell -Command "& { . %rice%\libs\ps\registry-changed.ps1; refresh-system | Out-Null }"
	sc start tor > nul
) else (
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /t REG_SZ /d "" /f > nul

	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 0 /f > nul

	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyOverride" /t REG_SZ /d "" /f > nul

	set curpath=%~dp0
	powershell -Command "& { . %rice%\libs\ps\registry-changed.ps1; refresh-system | Out-Null }"
	sc stop tor > nul
)
endlocal