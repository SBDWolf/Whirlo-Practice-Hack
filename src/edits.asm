@include

; remove game over on losing all lives
org $00cee7
    bra $0b

; skip intro
org $02b712
    db $01

; don't display lives and fragments count (originally updates every frame)
org $008304
    nop #34

; don't display game over count hud in password screen
org $00ee5f
    nop #33

; don't control the password screen
org password_hijack
    nop #4
    jmp $f867

; force password to be accepted. used by the stage select code
; org $00f855
;     ldx #$0016
;     nop #2

org $00fc9a
    bra $1c

; replace various pre-existing assets in the HUD with empty space
org $1c8a41
    db $40,$20,$40,$20
org $1c8a47
    db $40,$07,$20,$40,$20
org $1c8a59
    db $40,$20,$40,$20,$40
org $1c8a60
    db $40,$47,$20,$40,$20