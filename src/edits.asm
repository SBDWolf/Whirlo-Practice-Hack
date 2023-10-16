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

; replace various pre-existing assets in the HUD with empty space
org $1c8a41
    db $40,$20,$40,$20
org $1c8a47
    db $40,$07,$20,$40,$20
org $1c8a59
    db $40,$20,$40,$20,$40
org $1c8a60
    db $40,$47,$20,$40,$20