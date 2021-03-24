@echo off

if not "%1" == "" (
	powershell -Command "& { $vol = [math]::Round(%1*655.35); nircmd setvolume 0 $vol $vol }"
)