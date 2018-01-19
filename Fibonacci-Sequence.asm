name "fibonacci Series"
.model small

.data

    tittle db 0ah,"Fibonacci Series", 0ah,0dh,"$"
    line   db     " -------- ---------", 0ah,0ah,0dh,"$"
    message1 db "Plese enter the targetted number: ", "$"
    ;message2 db 0ah,0ah,0dh,"Enter any key to continue: ", "$"
    can db 5 dup (?)
    term dw 0 
    term1 dw 0
    term2 dw 1
    term3 dw 0 
    fact dw 1
    sum dw 0
    fil db 06
    col db 18h
    mit db 0
    num db 9 
.code
otra: 
 mov mit,0
 mov ax,0;load to all zero 
 mov bx,0
 mov dx,0
 mov fact,1
 mov sum,0 
 mov term,0 
 mov term1,0;
 mov term2,1
 mov term3,0 

 
;now the amount of inheritance is entered
 mov dx,offset can
 mov si,dx
 mov byte ptr[si],5
 mov ah,0ah
 int 21h   
 mov ah,02;jump line
 mov dl,0ah
 int 21h
 int 21h
 mov dl,0dh;return
 int 21h            
 mov ch,0h;
 mov cl,byte ptr[si+1]; 
 add si,cx;
 mov bx,0ah; 

loop1:
mov al,byte ptr[si+1];
and ax,0fh 
mul fact
add sum,ax
mov ax,fact
mul bx
mov fact,ax
dec si

loop loop1

 mov ax,sum;we have the sum in hexadecimal
 mov bl,2;divided by 2
 div bl
 mov mit,al;We spent the quotient 
 add mit,1;adding 1
 call locate;positioned

 mov ax,term1 
 mov bx,term2
 mov dx,term3 

while: 

mov cx,sum;we again sum 
add ax,bx;
mov term,ax;
mov bx,dx
mov dx,ax; 

mov term1,ax
mov term2,bx
mov term3,dx

cmp mit,cl;comparison
jz movement;if so moves next

salto:

call decimal;printed in decimal

inc fil
call locate

mov ax,term1
mov bx,term2
mov dx,term3

cmp sum,01
jz sigue   
dec sum
jmp while

movement:  

add col,18h
mov fil,05
jmp salto   

sigue:
    ;For Terminate 


finish:
mov ah,4ch
int 21h 

locate proc near

mov ah,02
mov bh,00
mov dh,fil
mov dl,col
int 10h

ret

locate endp 

decimal proc near

lea si,num+5
mov cx,0ah
mov bx,5        

vuelta:
cmp ax,cx;if less
jb menor
xor dx,dx
div cx;
add dl,30h;sum of 30
mov byte ptr[si],dl;placed in last number
dec si;decrement
dec bx
      ;decrease when not less than number given 
jmp vuelta 
    menor:
add al,30h
mov byte ptr[si],al
mov byte ptr[si+6],"$";placed at the end
mov ah,09
lea dx,num+bx;adding bx
int 21h

ret

