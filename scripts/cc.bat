@echo off
start "" cleanmgr /verylowdisk /autoclean /sagerun:5
powershell -File C:\tools\BCURRAN3\choco-cleaner.ps1