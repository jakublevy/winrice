@echo off

if /I "%1" equ "/on" (
    netsh advfirewall set allprofiles state on
) else (
    netsh advfirewall set allprofiles state off
)