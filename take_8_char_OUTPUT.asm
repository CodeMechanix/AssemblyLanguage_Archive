
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    MOV CL,8
    MOV AH,01H
LEVEL:
    INT 21H
    PUSH AX
    LOOP LEVEL 
    
    MOV AH,02H
    MOV DL,0DH
    INT 21H 
    MOV DL,0AH
    INT 21H
    MOV CL,8
    
PRINT:
    POP DX
    INT 21H  
    LOOP PRINT
        
MOV AH,4CH
INT 21H




