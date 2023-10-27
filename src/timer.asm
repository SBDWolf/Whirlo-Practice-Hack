@include

handle_timer:

    sep #$28 ; set decimal mode and 8 bit mode on A

    ; print previous room time without resetting timer if on post-world password screen (e.g. after beating a boss)...
    ; ...or if on the cutscene right after the final boss
    lda !current_scene : cmp #$8a : bne +
    jmp .print_previous_room

+   cmp #$c6 : bne +
    jmp .print_previous_room

    ; don't run if on title screen
+   lda !current_scene2 : beq ++

    ; don't run if in a cutscene
    cmp #$60 : bcs ++
    bra +
++  jmp .done

    ; if we've changed rooms, reset the timer and transfer its value to the previous room's time
+   lda !current_scene : cmp !previous_scene : beq .update_timer

    lda !timer_current_room_minutes : sta !timer_previous_room_minutes
    lda !timer_current_room_seconds : sta !timer_previous_room_seconds
    lda !timer_current_room_frames : sta !timer_previous_room_frames

    rep #$28 : jsl print_previous_room_time : sep #$28

    lda #$00 : sta !timer_current_room_minutes : sta !timer_current_room_seconds : sta !timer_current_room_frames

    bra .done

    .update_timer
        ; increment frame count by 1, rollover at 60
        lda !timer_current_room_frames : clc : adc #$01 : sta !timer_current_room_frames
        cmp #$60 : bcc .done
        lda #$00 : sta !timer_current_room_frames

        lda !timer_current_room_seconds : clc : adc #$01 : sta !timer_current_room_seconds
        cmp #$60 : bcc .done
        lda #$00 : sta !timer_current_room_seconds

        lda !timer_current_room_minutes : clc : adc #$01 : sta !timer_current_room_minutes
        cmp #$10 : bcc .done

        ; minutes count is 10, stop updating the timer
        lda #$09 : sta !timer_current_room_minutes
        lda #$59
        sta !timer_current_room_seconds : sta !timer_current_room_frames

    .done
        lda !current_scene : sta !previous_scene

        rep #$28 ; clear decimal mode and 8-bit mode on A


        ; restore hijacked instructions
        dec $50
        inc $52

        rtl  
    
    .print_previous_room:
        lda !timer_current_room_minutes : sta !timer_previous_room_minutes
        lda !timer_current_room_seconds : sta !timer_previous_room_seconds
        lda !timer_current_room_frames : sta !timer_previous_room_frames

        rep #$28 : jsl print_previous_room_time : sep #$28
        bra .done