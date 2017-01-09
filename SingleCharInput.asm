INCLUDE EMU8086.INC

org 100h

mov ah,01h
int 21h

mov dl,al 

printn

mov ah,02h
int 21h

mov ah,4ch

ret