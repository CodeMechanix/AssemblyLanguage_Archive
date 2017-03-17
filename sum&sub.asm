
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

    MOV AH,1    ;input function
    INT 21H
    MOV BL,AL
    
    mov ah,2
    mov dl,'+'
    int 21h
    mov ah,1
    
    INT 21H
    MOV BH,AL
    
    mov ah,2
    mov dl,'-'
    int 21h
    mov ah,1
    
    INT 21H
    MOV CL,AL  
    
    
    ADD BL,BH
    SUB BL,CL
    
    MOV AH,2    ;output function
    
    ;new line 
    ;MOV DL,0AH
    ;INT 21H
    ;MOV DL,0DH
    ;INT 21H 
        mov ah,2
        mov dl,'='
        int 21h
        
    ;ans printing
    MOV DL,BL 
    INT 21H

ret




