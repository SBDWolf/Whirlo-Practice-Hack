@include

; existing ram

!current_input_held = $21
!current_input_pressed = $31
!rng = $5e
!current_scene = $60

; new ram

; not sure this is actually free ram
!timer_current_room_minutes = $7e7300
!timer_current_room_seconds = $7e7302
!timer_current_room_frames = $7e7304
!timer_previous_room_minutes = $7e7306
!timer_previous_room_seconds = $7e7308
!timer_previous_room_frames = $7e730a
!previous_scene = $7e730c
!stage_selected = $7e730e
!pressed_start = $7e7310

; rom

;stage_load = $008c84
;paused_hijack = $00d73c
password_hijack = $00f760
end_of_nmi_hijack = $0083a4
free_space = $01a000
