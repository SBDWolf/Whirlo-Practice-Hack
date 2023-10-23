@include

org end_of_nmi_hijack
    jsl handle_timer

; hijacks the routine that's normally used to print the lives counter and fragments counter (every frame)
org $008304
    jsl print_hud_info


; this runs while the game is paused
; org paused_hijack
;     jsl stage_select
;     nop 

;this runs on the password screen
org password_hijack
    jml stage_select2
    nop 

;allow password confirmation to handle a start press which should work regardless of cursor position
org $00f855
    jsl handle_start_press
    nop 

org $00fc94
    jsl handle_start_press_part2
    nop 
    nop 