#NoEnv
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1
SetControlDelay -1

winTitle := "revoSleep"

Run, revoSleep

WinWait, % winTitle
IfWinExist, % winTitle
{
   WinActivate, % winTitle
   ;ControlClick, x30 y40, % winTitle,,,, NA ; Check D:
   ;ControlClick, x130 y180, % winTitle,,,, NA ; Sleep
   ;Sleep, 10
   ;ControlClick, x475 y15, % winTitle,,,, NA ; Minimalize
   
   
   
   
   ControlClick, x250 y90, % winTitle,,,, NA ; NO
}
