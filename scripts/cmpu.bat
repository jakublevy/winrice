@echo off
pwsh -Command "& { $global:au_Root = $env:userprofile + '\Repos\chocopkgs'; Update-AUPackages }"

rem setlocal
rem set "olddir=%~dp0"
rem cd "C:\Users\jakub\Repos\chocopkgs"
rem git pull origin master
rem pwsh -File update_all.ps1 -Name *
rem cd "%olddir%"
rem endlocal