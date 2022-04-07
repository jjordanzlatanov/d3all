#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

pressedEnter := False

; Disable script with Alt + `
^`::
    Suspend, Toggle
    text := "Started Script"

    If (A_IsSuspended) {
        text := "Stopped Script"
    }

    MsgBox, , Main, %text%, 0.60
    Return

`::
    Reload
    Return

; Salvage while holding Alt
Alt::
    pressedEnter := !pressedEnter
    Click
    Sleep, 100
    Send, {Enter}
    Return
    
Alt Up::
    If (pressedEnter) {
        pressedEnter := False
        Send, {Enter}
    }
    Return