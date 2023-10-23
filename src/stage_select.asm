@include

; stage_select:
;     lda.b $30
;     and #$2000
;     beq +

;     jsl stage_load

; +   lda.b $30
;     and #$1000
;     rtl

stage_select2:
    lda.b $30
    and #$0030
    beq ++
    and #$0020 
    beq +
    ; l
    lda !stage_selected : sec : sbc #$0001 : sta !stage_selected
    bra ++

    ; r
+   lda !stage_selected : clc : adc #$0001 : sta !stage_selected

++  lda.b $30
    and #$1000
    beq +
    ; write stage index
    lda !stage_selected : sta.b $39
    ; write #$0000 into the stage data pointer. this makes some other code during the stage select fall back into a default?
    lda #$0000 : sta $3c
    ;asl : tax : lda.l stage_data_pointer_table,x : asl : sta.b $3c
    
    lda #$0001 : sta !pressed_start
    
    jml $00f843


+   lda #$0000 : sta !pressed_start
    ; restore hijacked instructions
    lda.b $30
    and #$0100

    
    jml $00f765

handle_start_press:
    lda !pressed_start
    beq +
    ldx #$0016
    rtl 

;   restore hijacked instructions
+   lda $0500
    asl
    tax
    
    rtl


handle_start_press_part2:
    lda !pressed_start
    beq +
    lda #$00
    rtl 
    
+   lda $019e54,x
    cmp $38
    rtl 


; stage_data_pointer_table:
;     dw $0000
;     dw $0000
;     dw $81bc
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $0000
;     dw $bcb2