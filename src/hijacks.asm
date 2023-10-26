@include

org end_of_nmi_hijack
    jsl handle_timer

;hijacks the routine that's normally used to print the lives counter and fragments counter (every frame)
org $008304
    jsl print_hud_info

;this runs on the password screen
org password_hijack
    jml stage_select2

; hijack graphical updates during the password screen
org $0082f2
    jsl print_selected_stage
    nop