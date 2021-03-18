@echo off

assoc .pwsh=PowerShellFileNew
ftype PowerShellFileNew=wt.exe pwsh.exe -File "%1"