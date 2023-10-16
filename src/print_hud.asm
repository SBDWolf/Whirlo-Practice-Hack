@include

print_hud_info:
    lda #$2f47
    sta $2116
    lda !timer_room_minutes
    ora #$2080
    sta $2118

    lda #$2040
    sta $2118
    
    lda !timer_room_seconds
    lsr #4
    ora #$2080
    sta $2118

    lda !timer_room_seconds
    and #$000f
    ora #$2080
    sta $2118

    lda #$2040
    sta $2118

    lda !timer_room_frames
    lsr #4
    ora #$2080
    sta $2118

    lda !timer_room_frames
    and #$000f
    ora #$2080
    sta $2118

    rtl  