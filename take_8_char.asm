
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    MOV CL,2
    MOV AH,01H
LEVEL:
    INT 21H
    PUSH AX
    LOOP LEVEL
    
MOV AH,4CH
INT 21H




