@echo off
powershell -Command "& { $global:au_Root = $env:userprofile + '\Repos\chocopkgs'; Update-AUPackages }"