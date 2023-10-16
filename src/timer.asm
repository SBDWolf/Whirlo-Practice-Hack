@include

handle_timer:

    .update_timer

        sep #$28 ; set decimal mode and 8 bit mode on A
        ; increment frame count by 1, rollover at 60
        lda !timer_room_frames : clc : adc #$01 : sta !timer_room_frames
        cmp #$60 : bcc .done
        lda #$00 : sta !timer_room_frames

        lda !timer_room_seconds : clc : adc #$01 : sta !timer_room_seconds
        cmp #$60 : bcc .done
        lda #$00 : sta !timer_room_seconds

        lda !timer_room_minutes : clc : adc #$01 : sta !timer_room_minutes
        cmp #$10 : bcc .done

        ; minutes count is 10, stop updating the timer
        lda #$09 : sta !timer_room_minutes
        lda #$59
        sta !timer_room_seconds : sta !timer_room_frames

    .done
        rep #$28 ; clear decimal mode and 8-bit mode on A


        ; restore hijacked instructions
        dec $50
        inc $52

        rtl  