@echo off
DISM /Online /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0

rem for powershell
rem Remove-WindowsCapability -online -name App.Support.QuickAssist~~~~0.0.1.0