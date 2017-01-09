include emu8086.inc

mov ah,01h
int 21h

sub al,48

printn

mov bl,2
div bl

cmp ah,0
jz even        ; jump if zero
jmp odd        ; jump  JZ,JG,JL,JGE,JLE,JE


EVEN:
    printn "EVEN"
    jmp exit

ODD:
    printn "ODD"
    jmp exit
    
exit:
    mov ah,4ch
    int 21h

ret



