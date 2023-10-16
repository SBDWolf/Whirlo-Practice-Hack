@include

org end_of_nmi_hijack
    jsl handle_timer

; hijacks the routine that's normally used to print the lives counter and fragments counter (every frame)
org $008304
    jsl print_hud_info