@echo off
rem pwsh -Command "& { $global:au_Root = $env:userprofile + '\Repos\chocopkgs'; Update-AUPackages }"

setlocal
set "olddir=%~dp0"
cd "C:\Users\jakub\Repos\chocopkgs"
pwsh -File "update_all.ps1"
cd "%olddir%"
endlocal