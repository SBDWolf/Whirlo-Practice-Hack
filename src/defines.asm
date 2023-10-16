@include

; existing ram

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

; rom

end_of_nmi_hijack = $0083a4
free_space = $01a000
