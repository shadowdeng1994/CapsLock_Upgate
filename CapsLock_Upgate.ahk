;=====================================================================o
;                   Feng Ruohang's AHK Script                         | 
;                      CapsLock Enhancement                           |
;---------------------------------------------------------------------o
;Description:                                                         |
;    This Script is wrote by Feng Ruohang via AutoHotKey Script. It   |
; Provieds an enhancement towards the "Useless Key" CapsLock, and     |
; turns CapsLock into an useful function Key just like Ctrl and Alt   |
; by combining CapsLock with almost all other keys in the keyboard.   |
;                                                                     |
;Summary:                                                             |
;o----------------------o---------------------------------------------o
;|CapsLock;             | {ESC}  Especially Convient for vim user     |
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent|
;|CapsLock + hjklwb     | Vim-Style Cursor Mover                      |
;|CaspLock + uiop       | Convient Home/End PageUp/PageDn             |
;|CaspLock + nm,.       | Convient Delete Controller                  |
;|CapsLock + zxcvay     | Windows-Style Editor                        |
;|CapsLock + Direction  | Mouse Move                                  |
;|CapsLock + Enter      | Mouse Click                                 |
;|CaspLock + {F1}!{F7}  | Media Volume Controller                     |
;|CapsLock + qs         | Windows & Tags Control                      |
;|CapsLock + ;'[]       | Convient Key Mapping                        |
;|CaspLock + dfert      | Frequently Used Programs (Self Defined)     |
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined) |
;|CapsLock + 67890-=    | Shifter as Shift                            |
;-----------------------o---------------------------------------------o
;|Use it whatever and wherever you like. Hope it help                 |
;=====================================================================o

;=====================================================================o
;                   Last modified by Shadow Deng                      | 
;                            on 2018/9/9                              |
;---------------------------------------------------------------------o

;=====================================================================o
;                       CapsLock Initializer                         ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;             CapsLock + CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::                                                           ;|
if(A_PriorHotkey <> "CapsLock" or A_TimeSincePriorHotkey > 300)      ;|
{                                                                    ;|
	KeyWait, CapsLock                                            ;|
	return                                                       ;|
}                                                                    ;|
Send, {ESC}                                                          ;|
return                                                               ;|
                                                                     ;|
;CapsLock::Send, {ESC}                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Ctrl + Left (Move as [vim: b]);|
;                      CapsLock + k |  Ctrl + Right(Move as [vim: w]);|
;                      CapsLock + l |  Right                         ;|
;                      CapsLock + u |  Up                            ;|
;                      CapsLock + i |  Down                          ;|
;                      CapsLock + ; |  Home                          ;|
;                      CapsLock + ' |  End                           ;|
;                            Shift Compatible                        ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, {left}                                                 ;|
else                                                                 ;|
    Send, +{left}                                                    ;|
return                                                               ;|
CapsLock & j::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, ^{left}                                                ;|
else                                                                 ;|
    Send, ^+{left}                                                   ;|
return                                                               ;|
CapsLock & k::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, ^{right}                                               ;|
else                                                                 ;|
    Send, ^+{right}                                                  ;|
return                                                               ;|
CapsLock & l::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, {right}                                                ;|
else                                                                 ;|
    Send, +{right}                                                   ;|
return                                                               ;|
CapsLock & SC027::                                                   ;|
if GetKeyState("shift") = 0                                          ;|
	Send, {home}                                                 ;|
else                                                                 ;|
    Send, +{home}                                                    ;|
return                                                               ;|
CapsLock & '::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, {end}                                                  ;|
else                                                                 ;|
    Send, +{end}                                                     ;|
return                                                               ;|
CapsLock & u::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, {up}                                                   ;|
else                                                                 ;|
    Send, +{up}                                                      ;|
return                                                               ;|
CapsLock & i::                                                       ;|
if GetKeyState("shift") = 0                                          ;|
	Send, {down}                                                 ;|
else                                                                 ;|
    Send, +{down}                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Windows operation                      ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + - |  WinMinimize                   ;|
;                      CapsLock + = |  WinMaximize                   ;|
;                      CapsLock + 0 |  WinRestore                    ;|
;-----------------------------------o---------------------------------o
CapsLock & -:: WinMinimize, A                                        ;|
CapsLock & =:: WinMaximize, A                                        ;|
CapsLock & 0:: WinRestore, A                                         ;|
;---------------------------------------------------------------------o

;=====================================================================o
;                     CapsLock windows desktop                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + d |  win+ctrl+d                    ;|
;                    CapsLock + Del |  win+ctrl+F4                   ;|
;                      CapsLock + , |  win+ctrl+left                 ;|
;                      CapsLock + . |  win+ctrl+right                ;|
;-----------------------------------o---------------------------------o
CapsLock & d:: Send, #^{d}                                           ;|
CapsLock & Del:: Send, #^{F4}                                        ;|
CapsLock & ,:: Send, #^{left}                                        ;|
CapsLock & .:: Send, #^{right}                                       ;|
;---------------------------------------------------------------------o

;=====================================================================o
;                           CapsLock Extension                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + 5 |  Type in %>%                   ;|
;                      CapsLock + a |  Type for awk                  ;|
;                      CapsLock + r |  Type for Rscript              ;|
;                      CapsLock + q |  ctrl+a                        ;|
;                      CapsLock + w |  ctrl+e                        ;|
;                      CapsLock + t |  Type for write.table          ;|
;-----------------------------------o---------------------------------o
CapsLock & 5:: Send `%>`%`                                           ;|
CapsLock & a:: Send awk -F `"\t`"` -v OFS=`"\t`"` '{{}{}}'           ;|
CapsLock & r:: Send Rscript -e `"`"                                  ;|
CapsLock & q:: Send, ^a                                              ;|
CapsLock & w:: Send, ^e                                              ;|
CapsLock & t:: Send quote=F,row.names=F,sep=`"\t`",col.names=F       ;|
;---------------------------------------------------------------------o

;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;             CapsLock + Numpad1    |  Mouse LeftDown                ;|
;             CapsLock + Numpad2    |  Mouse Down                    ;|
;             CapsLock + Numpad3    |  Mouse RightDown               ;|
;             CapsLock + Numpad4    |  Mouse Left                    ;|
;             CapsLock + Numpad6    |  Mouse Right                   ;|
;             CapsLock + Numpad7    |  Mouse LeftUp                  ;|
;             CapsLock + Numpad8    |  Mouse Up                      ;|
;             CapsLock + Numpad9    |  Mouse RightUp                 ;|
;             CapsLock + Numpad5    |  Mouse Left Push(Release)      ;|
;             CapsLock + Numpad0    |  Mouse Right Push(Release)     ;|
;             CapsLock + NumpadEnd  |  Mouse LeftDown Fastly         ;|
;             CapsLock + NumpadDown |  Mouse Down Fastly             ;|
;             CapsLock + NumpadPgDn |  Mouse RightDown Fastly        ;|
;             CapsLock + NumpadLeft |  Mouse Left Fastly             ;|
;             CapsLock + NumpadRight|  Mouse Right Fastly            ;|
;             CapsLock + NumpadHome |  Mouse LeftUp Fastly           ;|
;             CapsLock + NumpadUp   |  Mouse Up Fastly               ;|
;             CapsLock + NumpadPgUp |  Mouse RightUp Fastly          ;|
;             CapsLock + NumpadClear|  Mouse Left Push(Release)      ;|
;             CapsLock + NumpadIns  |  Mouse Right Push(Release)     ;|
;-----------------------------------o---------------------------------o
CapsLock & Numpad8::     MouseMove, 0, -10, 0, R                     ;|
CapsLock & Numpad2::     MouseMove, 0, 10, 0, R                      ;|
CapsLock & Numpad4::     MouseMove, -10, 0, 0, R                     ;|
CapsLock & Numpad6::     MouseMove, 10, 0, 0, R                      ;|
CapsLock & Numpad1::     MouseMove, -10, 10, 0, R                    ;|
CapsLock & Numpad3::     MouseMove, 10, 10, 0, R                     ;|
CapsLock & Numpad7::     MouseMove, -10, -10, 0, R                   ;|
CapsLock & Numpad9::     MouseMove, 10, -10, 0, R                    ;|
;-----------------------------------o                                ;|
CapsLock & Numpad5::                                                 ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
CapsLock & Numpad0::                                                 ;|
SendEvent {Blind}{RButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{RButton up}                                        ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & NumpadUp::    MouseMove, 0, -50, 0, R                     ;|
CapsLock & NumpadDown::  MouseMove, 0, 50, 0, R                      ;|
CapsLock & NumpadLeft::  MouseMove, -50, 0, 0, R                     ;|
CapsLock & NumpadRight:: MouseMove, 50, 0, 0, R                      ;|
CapsLock & NumpadEnd::   MouseMove, -50, 50, 0, R                    ;|
CapsLock & NumpadPgDn::  MouseMove, 50, 50, 0, R                     ;|
CapsLock & NumpadHome::  MouseMove, -50, -50, 0, R                   ;|
CapsLock & NumpadPgUp::  MouseMove, 50, -50, 0, R                    ;|
;-----------------------------------o                                ;|
CapsLock & NumpadClear::                                             ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
CapsLock & NumpadIns::                                               ;|
SendEvent {Blind}{RButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{RButton up}                                        ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                           CapsLock Deletor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  Ctrl + BackSpace (Del a Word) ;|
;                     CapsLock + m  |  Delete                        ;|
;                     CapsLock + b  |  BackSpace                     ;|
;-----------------------------------o---------------------------------o
CapsLock & m:: Send, {Del}                                           ;|
CapsLock & n:: Send, ^{BS}                                           ;|
CapsLock & b:: Send, {BS}                                            ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                            CapsLock Editor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + z  |  Ctrl + z (Cancel)             ;|
;                     CapsLock + x  |  Ctrl + x (Cut)                ;|
;                     CapsLock + c  |  Ctrl + c (Xshell Copy)        ;|
;                     CapsLock + v  |  Ctrl + v (Xshell Paste)       ;|
;                     CapsLock + y  |  Ctrl + y (Yeild)              ;|
;-----------------------------------o---------------------------------o
CapsLock & z:: Send, ^z                                              ;|
CapsLock & x:: Send, ^x                                              ;|
CapsLock & c:: Send, ^{Ins}                                          ;|
CapsLock & v:: Send, +{Ins}                                          ;|
CapsLock & y:: Send, ^y                                              ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Media Controller                    ;|
;-----------------------------------o---------------------------------o
;                    CapsLock + F1  |  Volume_Mute                   ;|
;                    CapsLock + F2  |  Volume_Down                   ;|
;                    CapsLock + F3  |  Volume_Up                     ;|
;                    CapsLock + F3  |  Media_Play_Pause              ;|
;                    CapsLock + F5  |  Media_Prev                    ;|
;                    CapsLock + F6  |  Media_Next                    ;|
;                    CapsLock + F7  |  Media_Stop                    ;|
;-----------------------------------o---------------------------------o
CapsLock & F1:: Send, {Volume_Mute}                                  ;|
CapsLock & F2:: Send, {Volume_Down}                                  ;|
CapsLock & F3:: Send, {Volume_Up}                                    ;|
CapsLock & F4:: Send, {Media_Play_Pause}                             ;|
CapsLock & F5:: Send, {Media_Prev}                                   ;|
CapsLock & F6:: Send, {Media_Next}                                   ;|
CapsLock & F7:: Send, {Media_Stop}                                   ;|
;---------------------------------------------------------------------o
