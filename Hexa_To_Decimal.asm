INCLUDE EMU8086.INC
.model small
.stack 100h
.data
S_1 db 10,13,'Enter a HexaDecimal: $' 
;printn
S_2 db 10,13,'DECIMAL Number IS : $'
.code   

Step_1:
   mov ax,@data
   mov ds,ax
   lea dx,S_1
   mov ah,9
   int 21h 
   mov ah,1
   int 21h
   mov bl,al   
   jmp Step_2
   
Step_2:   
   cmp bl,'9'
   ja Hexa_Calc
   jb Step_3
   je Step_3
     
 Hexa_Calc:
    cmp bl,'F'
    ja Final  
    lea dx,S_2 
    mov ah,9
    int 21h
    mov dl,49d
    mov ah,2
    int 21h
    sub bl,17d
    mov dl,bl
    mov ah,2
    int 21h 
    jmp Step_4
     
 Step_4:
    
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov cl,al
    jmp exit
    
   
 Step_3:
   cmp bl,'0'
   jb Final
   lea dx,S_2 
   mov ah,9
   int 21h   
   mov dl,bl
   mov ah,2
   int 21h
   jmp Step_4
   
 Final:   
       mov ah,9
       int 21h
       mov ah,1
       int 21h      
       mov bl,al       
       jmp Step_2
	   
exit: