@include

; every frame
print_hud_info:
    lda #$2f42
    jsr print_rng_value


    lda #$2f47
    sta $2116
    lda !timer_current_room_minutes
    ora #$2080
    sta $2118

    lda #$2040
    sta $2118
    
    lda !timer_current_room_seconds
    lsr #4
    ora #$2080
    sta $2118

    lda !timer_current_room_seconds
    and #$000f
    ora #$2080
    sta $2118

    lda #$2040
    sta $2118

    lda !timer_current_room_frames
    lsr #4
    ora #$2080
    sta $2118

    lda !timer_current_room_frames
    and #$000f
    ora #$2080
    sta $2118

    .done
        rtl 

print_previous_room_time:
    lda #$2f27
    sta $2116
    lda !timer_previous_room_minutes
    ora #$2080
    sta $2118

    lda #$2040
    sta $2118
    
    lda !timer_previous_room_seconds
    lsr #4
    ora #$2080
    sta $2118

    lda !timer_previous_room_seconds
    and #$000f
    ora #$2080
    sta $2118

    lda #$2040
    sta $2118

    lda !timer_current_room_frames
    lsr #4
    ora #$2080
    sta $2118

    lda !timer_current_room_frames
    and #$000f
    ora #$2080
    sta $2118

    .done
        rtl 

print_selected_stage:
    ; restore hijacked instructions
    lda.b $56
    sta $212c

    lda.b !current_scene
    cmp #$0088
    bne .done


    lda.l !stage_selected
    beq +
    tay 
    lda #$0000
-   clc : adc #$0020
    dey 
    bne -
+   tax 


    phx 
    lda #$2dc4
    jsr .print_text_string_eng
    plx 

    ; multiply by two; japanese names have two row entries, one for the dakuten, one for the main name
    txa : asl : tax 

    lda #$2de4
    jsr .print_text_string_jp
    
    lda #$2e04
    jsr .print_text_string_jp

    lda #$2f04
    jsr print_rng_value

    .done
        rtl

    .print_text_string_jp:
        ; expects the position to print the string at to be passed into A
        ; expects the table offset for the string to be passed into X

        sta $2116

        ; loop length set to 0x10, so each string is always expected to be 0x10 long
        ldy #$0010
    
-       lda.l stage_names_jp,x
        sta $2118
        inx 
        inx 
        dey 
        bne -

        rts 

    .print_text_string_eng:
        ; expects the position to print the string at to be passed into A
        ; expects the table offset for the string to be passed into X
        
        sta $2116
        
        ; loop length set to 0x10, so each string is always expected to be 0x10 long
        ldy #$0010

-       lda.l stage_names_eng,x
        sta $2118
        inx 
        inx 
        dey 
        bne -

        rts 


print_rng_value:
    ; expects the position to print the rng at to be passed into A
    sta $2116
    lda !rng
    and #$00ff
    lsr #4
    ora #$2080
    sta $2118

    lda !rng
    and #$000f
    ora #$2080
    sta $2118

    rts 


stage_names_eng:
    dw "SANDROS 1       "
    dw "HAUNTED FOREST 1"
    dw "HAUNTED FOREST 2"
    dw "SANDROS 2       "
    dw "VALLEY OF SIZUS "
    dw "MT. ALSANDRA 1  "
    dw "MT. ALSANDRA 2  "
    dw "MT. ALSANDRA 3  "
    dw "MT. ALSANDRA 4  "
    dw "CAULDRA CASTLE 1"
    dw "GRAMPS DOCK 1   "
    dw "THE PRINCESS 1  "
    dw "CATACOMB 1      "
    dw "CATACOMB 2      "
    dw "CATACOMB 3      "
    dw "CATACOMB 4      "
    dw "CATACOMB 5      "
    dw "CATACOMB 6      "
    dw "DRAGON FOREST 1 "
    dw "TOADSTOOL CAVE 1"
    dw "TOADSTOOL CAVE 2"
    dw "TOADSTOOL CAVE 3"
    dw "TOADSTOOL CAVE 4"
    dw "TOADSTOOL CAVE 5"
    dw "THE ANCONDA 1   "
    dw "SEA OF SIRRAH 1 "
    dw "SEA OF SIRRAH 2 "
    dw "PIRATE SHIP 1   "
    dw "PIRATE SHIP 2   "
    dw "PIRATE SHIP 3   "
    dw "PIRATE SHIP 4   "
    dw "PIRATE SHIP 5   "
    dw "PIRATE SHIP 6   "
    dw "PIRATE SHIP 7   "
    dw "PIRATE SHIP 8   "
    dw "PIRATE SHIP 9   "
    dw "TREE ISLAND 1   "
    dw "TREE ISLAND 2   "
    dw "TREE ISLAND 3   "
    dw "TREE ISLAND 4   "
    dw "TREE ISLAND 5   "
    dw "TREE ISLAND 6   "
    dw "SEA OF SIRRAH 3 "
    dw "TREE ISLAND 7B  "
    dw "CATACOMB 2      "
    dw "TREE ISLAND 7N  "
    dw "NEVERLAND 1     "
    dw "NEVERLAND 2     "
    dw "NEVERLAND 3     "
    dw "NEVERLAND 4     "
    dw "NEVERLAND 5     "
    dw "NEVERLAND 6     "
    dw "NEVERLAND 7     "
    dw "GOBLIN VALLEY 1 "
    dw "ENDLESS DESERT 1"
    dw "ENDLESS DESERT 2"
    dw "ENDLESS DESERT 3"
    dw "THE TOWER 1     "
    dw "THE TOWER 2     "
    dw "THE TOWER 3-1   "
    dw "THE TOWER 3-2   "
    dw "THE TOWER 3-3   "
    dw "THE TOWER 3-4   "
    dw "THE TOWER 3-5   "
    dw "THE TOWER 3-6   "
    dw "THE TOWER 3-7   "
    dw "THE TOWER 3-8   "
    dw "THE TOWER 3-9   "
    dw "THE TOWER 3-10  "
    dw "THE TOWER 3-11  "
    dw "THE TOWER 3-12  "
    dw "THE TOWER 3-13  "
    dw "THE TOWER 3-14  "
    dw "THE TOWER 3-15  "
    dw "THE TOWER 3-16  "
    dw "THE TOWER 4     "


; the japanese names are contained in jp_stage_names.txt
; the make_characters_jp_bin.py script will encode that txt file into characters_jp.bin

; the japanese names in the .bin file are actually made up of two separate entries
; one will contain the position of the (han)dakuten, while the other will contain the main text string for the stage name
stage_names_jp:
    incbin "characters_jp.bin"