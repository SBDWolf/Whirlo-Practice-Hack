@include


stage_select2:
    jsr .handle_dpad
    jsr .handle_shoulder


    lda.b !current_input_pressed
    and #$d0c0
    beq +
    ; write stage index
    lda !stage_selected : asl : tax : lda.l stage_indexes,x : sta.b $39
    ; write the stage data pointer. #$0000 seems to be some sort of default, but for some screens we want to load a specific state.
    lda.l stage_data_pointers,x : asl : sta.b $3c
    
    jml $00f843

+   jml $00f764 

    .handle_dpad:
        lda.b !current_input_held
        and #$0300
        beq ++

        lda !button_held_timer_dpad
        beq ..accept_input
        cmp #$0016
        bcs ..accept_input
        clc : adc #$0001 : sta !button_held_timer_dpad
        bra +++
        ..accept_input:
            ; only process input every 4 frames
            and #$0003
            bne ..accept_input_end


            lda !current_input_held
            and #$0200
            beq +
            ;left
            lda !stage_selected : sec : sbc #$0001 : sta !stage_selected
            bra ..accept_input_end
            ;right
+           lda !stage_selected : clc : adc #$0001 : sta !stage_selected

        ..accept_input_end
            lda !button_held_timer_dpad : clc : adc #$0001 : sta !button_held_timer_dpad       ; yes, this will eventually overflow. no, this doesn't feel worth extra instructions to cap :)
            bra +++
        

++      lda #$0000
        sta !button_held_timer_dpad

+++     rts 







    .handle_shoulder:
        lda.b !current_input_held
        and #$0030
        beq ++

        lda !button_held_timer_shoulder
        beq ..accept_input
        cmp #$0016
        bcs ..accept_input
        clc : adc #$0001 : sta !button_held_timer_shoulder
        bra +++
        ..accept_input:
            ; only process input every 2 frames
            and #$0001
            bne ..accept_input_end


            lda !current_input_held
            and #$0020
            beq +
            ;left
            lda !rng : sec : sbc #$0001 : sta !rng
            bra ..accept_input_end
            ;right
+           lda !rng : clc : adc #$0001 : sta !rng

        ..accept_input_end
            lda !button_held_timer_shoulder : clc : adc #$0001 : sta !button_held_timer_shoulder       ; yes, this will eventually overflow. no, this doesn't feel worth extra instructions to cap :)
            bra +++
        

++      lda #$0000
        sta !button_held_timer_shoulder

+++     rts 








stage_indexes:
    dw $0001,$0002,$0003,$0004,$0005
    dw $0006,$0007,$0008,$0009
    dw $000a,$000b,$000c,$000e,$0010,$000e,$000e,$003a,$000f
    dw $0011,$0012,$0013,$0014,$0015,$0016,$0017
    dw $0018,$004c,$0019,$003b,$001b,$001c,$001d,$001e,$001f,$0020,$0021
    dw $0042,$0025,$0044,$0026,$0045

stage_data_pointers:
    dw $0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$bc58,$0000,$0000,$c84c,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000