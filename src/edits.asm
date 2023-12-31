@include

; remove game over on losing all lives
org $00cee7
    ;nop #2
    bra $0b

; skip intro
org $02b712
    db $01

;don't display lives and fragments count (originally updates every frame)
org $008304
    nop #34

; don't display current password tiles
org $0082fd
    nop #3

;don't update password screen graphics
org $00f690
    nop #3

;don't display death counter in password screen
org $00f8b9
    nop #105

; don't control the password screen
org password_hijack
    nop #4
    jmp $f867

; immediately load stage in password screen after selecting it
org $00f93a
    nop #2

; force password to be accepted. used by the stage select code
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

; copy of those assets for some reason??
org $1c8c15
    db $40,$20,$40
org $1c8c1c
    db $40,$20,$40,$20
org $1c8c2d
    db $40,$20,$40,$20,$3d,$40
org $1c8c35
    db $40,$20,$40,$20