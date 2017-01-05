include emu8086.inc
org 100h

mov ah,01h
int 21h

sub al,48

mov bl,al

printn

cmp al,1
jz exit

mov bh,2

prime_loop:
    mov ah,0
    mov al,bl
    div bh
    
    cmp ah,0
    jz prime_chk
    
    inc bh
    jmp prime_loop
    
prime_chk:
    cmp bh,bl
    jz prime
    jmp not_prime
    
prime:
    printn "PRIME Number"
    jmp exit
not_prime:
    printn "NOT PRIME Number"
    jmp exit    
exit:
    mov ah,4ch
    int 21h
ret



