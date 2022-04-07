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
; Coordinates
; 19, 770 - Black background on chat scroll
; 500, 500 - Salvage menu
; 385, 290 - Salvage rares
; 320, 290 - Salvage magics
; 255, 290 - Salvage normals
; 165, 290 - Activate salvaging of legendaries
x::
    MouseGetPos, initX, initY
    Click, 500, 500
    Click, 385, 290
    Send, {Enter}
    Click, 320, 290
    Send, {Enter}
    Click, 255, 290
    Send, {Enter}
    Click, 165, 290
    MouseMove, initX, initY

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

XButton1::
    While (GetKeyState("XButton1", "P")) {
        Click Right
        Sleep, 100
    }

    Return

~Space::
    While (GetKeyState("Space", "P")) {
        Send, {ShiftUp}
        Click
        Sleep, 100
    }

    Return

attacking := False
1::
    attacking := !attacking

    If (attacking) {
        SetTimer, attack, 500
    }Else{
        SetTimer, attack, Off
        Send, {ShiftUp}
    }
    
    Return

attack:
    Send, asdf
    Send, {ShiftDown}
    Return