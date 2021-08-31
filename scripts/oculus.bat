@echo off

if /I "%1" == "/start" (
	sc start "OVRService"
	start "" "C:\Program Files\Oculus\Support\oculus-client\OculusClient.exe"
) else (
	taskkill /IM "OculusClient.exe" /F
	sc stop "OVRService"
)
