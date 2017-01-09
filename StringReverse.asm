; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
include "emu8086.inc"
; add your code here

printn 'Enter lenght of string'
mov ah,01h                     
int 21h

printn 
print 'Enter string here  '
mov cl,al

SUB cl,'0'
mov dl,cl
mov bx,0

p1:
mov ah,01h
int 21h

mov [2000+bx],ax
inc bx
dec cl
cmp cl,0
jne p1

printn
print 'inputed string : '   


mov cl,dl
mov [2000+bx],ax

output:
mov dl,[1999+bx]
mov ah,2h
int 21h
dec bx
dec cl
cmp cl,0
jne output

printn

mov ax,4c00h
int 21h
                     

ret



