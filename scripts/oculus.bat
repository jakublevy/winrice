@echo off

if /I "%1" equ "/start" (
	sc start "OVRService"
) else (
	taskkill /IM "OculusClient.exe" /F
	sc stop "OVRService"
)
