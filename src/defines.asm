@include

; constants
!scene_count = $004c

; existing ram

!current_input_held = $20
!current_input_pressed = $30
!rng = $5e
!current_scene = $60
; is this a copy of the actual currently loaded scene?
!current_scene2 = $3e

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
!button_held_timer_dpad = $7e7310
!button_held_timer_shoulder = $7e7312

; rom

password_hijack = $00f760
end_of_nmi_hijack = $0083a4
free_space = $03cd50
