@echo off

assoc .ps1=PowerShellFileV
ftype PowerShellFileV=wt.exe powershell.exe -File "%1"