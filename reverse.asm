.MODEL SMALL
.STACK 100H   ;declare the size of stack
.CODE

  MAIN PROC      ;start of main procedure
        
        XOR CX,CX     ;initialize zero to counter register CX
        
        MOV AH,01H
        INT 21H         ;calling of DOS function to take input single character
        
    WHILE:
        CMP AL,0DH      ;if AL==13(ENTER) go to END_WHILE level
        JE END_WHILE
        
        PUSH AX         ;put ax value on stack
        INC CX          ;increasing the value of counter register CX by adding 1
        
        INT 21H         ;calling of DOS function
        JMP WHILE       ; go to Level WHILE without ant condition
        
        
    END_WHILE:
        MOV AH,02H     ;copy value to AH for single character outpuT        
        
        MOV DL,0AH     ; go to next line 
        INT 21H        ;single character output 
        
        JCXZ EXIT      ; go to Level EXIT if ECX count register is zero
        
    TOP:
        POP DX         ;take out value form stack to DX
        INT 21H        ;print the value of DX
        LOOP TOP       ;execute the Level TOP untill CX==0
        
    EXIT:
        MOV AH,4CH     ;exit programm
        INT 21H 
              
  MAIN ENDP
    END MAIN