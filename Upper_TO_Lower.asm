.MODEL SMALL
.STACK 100H
.DATA
.CODE

    PROC MAIN
        
      XOR AX,AX
      
      MOV AH,01H
      INT 21H
      or AL,20H
      
      ;FOR LOWER TO UPPER 
      ;AND AL,0DFH 
      
      MOV DL,AL
      MOV Ah,02H
      INT 21H
      
      
      MAIN ENDP
    END MAIN
    RET