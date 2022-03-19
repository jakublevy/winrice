#NoEnv
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1

Run, "C:\Program Files\Mozilla Thunderbird\thunderbird.exe",, Min
WinWait, ahk_exe thunderbird.exe
WinMinimize, ahk_exe thunderbird.exe