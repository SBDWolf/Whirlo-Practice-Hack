@include


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
    and #$d0c0
    beq +
    ; write stage index
    lda !stage_selected : asl : tax : lda.l stage_indexes,x : sta.b $39
    ; write #$0000 into the stage data pointer. this makes some other code during the stage select fall back into a default?
    lda #$0000 : sta $3c
    ;asl : tax : lda.l stage_data_pointer_table,x : asl : sta.b $3c
    
    
    jml $00f843


    
+   jml $00f764 


stage_indexes:
    dw $0001
    dw $0002
    dw $0003
    dw $0004
    dw $0005

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