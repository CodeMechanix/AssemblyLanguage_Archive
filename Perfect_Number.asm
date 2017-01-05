
org 100h

include "emu8086.inc"

mov ah,01h
int 21h

sub al,48

mov bl,al

mov cl,0

printn
cmp bl,1
je perfect_chk


printn

mov bh,1

perfect_loop:

    mov ah,0
    mov al,bl
    div bh
    
    cmp ah,0
    je sum

label:
        
    inc bh
    cmp bh,bl
    je perfect_chk
    
    jmp perfect_loop
    
sum:
    
    add cl,bh
    jmp label
    
perfect_chk:

    cmp cl,bl
    je perfect
    jmp not_perfect
    
perfect:

    printn "Perfect Number"
    jmp exit
    
not_perfect:

    printn "Not Perfect Number"
    jmp exit
    
exit:

    mov ah,4ch
    int 21h

ret