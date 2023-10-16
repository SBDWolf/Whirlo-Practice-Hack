; wouldn't work properly :)

; @include

; stage_select:
;     lda.b $30
;     and #$2000
;     beq +

;     jsl stage_load

; +   lda.b $30
;     and #$1000
;     rtl

; stage_select2:
;     lda.b $30
;     and #$0030
;     beq ++
;     and #$0020 
;     beq +
;     ; l
;     lda !stage_selected : sec : sbc #$0001 : sta !stage_selected
;     bra ++

;     ; r
; +   lda !stage_selected : clc : adc #$0001 : sta !stage_selected

; ++  lda.b $30
;     and #$1000
;     beq +
;     lda !stage_selected : sta.b $39
    
;     lda #$0001 : sta !pressed_start
    
;     jml $00f843


; +   lda #$0000 : sta !pressed_start
;     ; restore hijacked instructions
;     lda.b $30
;     and #$0100

    
;     jml $00f765

; handle_start_press:
;     lda !pressed_start
;     beq +
;     ldx #$0016
;     rtl 

; ;   restore hijacked instructions
; +   lda $0500
;     asl
;     tax
    
;     rtl


; handle_start_press_part2:
;     lda !pressed_start
;     beq +
;     lda #$00
;     rtl 
    
; +   lda $019e54,x
;     cmp $38
;     rtl 