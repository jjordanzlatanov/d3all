#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^`::
    Suspend, Toggle
    text := "Started Script"

    If (A_IsSuspended) {
        text := "Stopped Script"
    }

    MsgBox, , Main, %text%, 0.80
    Return

`::
    Reload
    Return

1::   
    Send, hi this
    Return

1 Up::
    Send, is a script
    Return