INCLUDE EMU8086.INC
org 100h

mov ah,01h
int 21h

mov bl,al

mov ah,01h
int 21h

add al,bl

mov bl,al

mov ah,01h
int 21h

sub bl,al

mov dl,bl 

mov ah,02h
int 21h

mov ah,4ch

ret