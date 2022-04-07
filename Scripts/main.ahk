#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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

#IfWinActive, Diablo III
; Salvage while holding x
x::
    While (GetKeyState("x", "P")) {
        Click
        Send, {Enter}
        Sleep, 100
    }

    PixelGetColor, color, 19, 770

    If (color == 0x000000) {
        Send, {Enter}
    }
    Return