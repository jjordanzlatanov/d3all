#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setPicking := True
picking := False
SetTimer, pick, 100

attacking := False

; Disable script with Alt + `
^`::
+e::
    Suspend, Toggle
    text := "Started Script"

    If (A_IsSuspended) {
        text := "Stopped Script"
    }

    MsgBox, , Main, %text%, 0.60
    Return

`::
~^s::
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
    Sleep, 200
    Click, 385, 290
    Sleep, 200
    Send, {Enter}
    Click, 320, 290
    Sleep, 200
    Send, {Enter}
    Click, 255, 290
    Sleep, 200
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

v::
    setPicking := !setPicking

~Space::
    picking := True
    Return

Space Up::
    picking := False
    Return

pick:
    If (picking && setPicking) {
        Click
    }

    Return

e::
    attacking := !attacking

    If (attacking) {
        SetTimer, attack, 150
    }Else{
        SetTimer, attack, Off
    }


attack:
    PixelGetColor, color, 683, 996
    PixelGetColor, colorCD, 655, 1004
    
    If (color != 0x000000 && colorCD == 0x324433) {
        Send, a
    }

    PixelGetColor, color, 749, 996
    PixelGetColor, colorCD, 719, 1004

    If (color != 0x000000 && colorCD == 0x313F40) {
        Send, s
    }

    PixelGetColor, color, 816, 996
    PixelGetColor, colorCD, 786, 1004

    If (color != 0x000000 && colorCD == 0x547052) {
        Send, d
    }

    Return