@include

; existing ram

!rng = $5e
!current_scene = $60

; new ram

; not sure this is actually free ram. it seems to automatically get reset to 0 after death.
!timer_room_minutes = $7fbc00
!timer_room_seconds = $7fbc02
!timer_room_frames = $7fbc04

; rom

end_of_nmi_hijack = $0083a4
free_space = $01a000
