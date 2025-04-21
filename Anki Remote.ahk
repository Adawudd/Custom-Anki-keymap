#NoEnv
#SingleInstance, Force
SetTitleMatchMode, 2

;— for scancode discovery (only while testing) —  
F2::KeyHistory

;— load the Interception wrapper —  
#Include Lib\AutoHotInterception.ahk

;—— CONFIG ——
remoteDevice := 2      ; ← replace with your remote’s Device ID from ListDevices.ahk
POWER_SC     := 0x05E  ; ← replace with your remote’s Power key SC (e.g. 0x05E)

;—— state ——
remapMode := false

;—— Toggle remapping on/off with Play/Pause ——
Media_Play_Pause::
    remapMode := !remapMode
    ToolTip, % remapMode
        ? "Remap ON: ↑↓←→→1 3 4 2 | Backspace→Anki | Home→D | PgDn→Y | PgUp→E | AppsKey→B"
        : "Remap OFF: everything normal"
    SetTimer, RemoveToolTip, -800
Return

RemoveToolTip:
    ToolTip
Return

;—— Your existing AHK hotkeys (only when remapMode is ON) ——
#If remapMode
    Up::      Send, 1
    Down::    Send, 3
    Left::    Send, 4
    Right::   Send, 2

    Backspace::
        if WinExist("ahk_exe anki.exe")
            WinClose, ahk_exe anki.exe
        else
            Run, %A_StartMenu%\Programs\Anki.lnk
    Return

    Browser_Back Up::  Send, d
    PgDn Up::         Send, y
    PgUp Up::         Send, e
    AppsKey Up::      Send, b
#If

;—— Now set up Interception to swallow only your remote’s Power key ——
; Create context and capture all keyboard events
ctx := Interception_CreateContext()
Interception_SetFilter(ctx
    , Interception_IsKeyboard()
    , INTERCEPTION_FILTER_KEY_DOWN | INTERCEPTION_FILTER_KEY_UP
)

; Main loop: intercept every key, drop the remote’s Power when remapMode=ON
Loop {
    dev    := Interception_Wait(ctx)
    stroke := Interception_Receive(ctx)

    if (dev = remoteDevice && remapMode && stroke.code = POWER_SC) {
        ; swallow it: do nothing
        Continue
    }

    ; otherwise, let it through
    Interception_Send(ctx, dev, stroke)
}
