.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    XOR BX,BX
    
    MOV AX,5000
    MOV BX,0E10H
    
HOUR:
    DIV BX
    
MIN:
    XOR BX,BX
    MOV AX,DX
    MOV BL,3CH
    DIV BL

SEC:
    
  
EXIT:
    MOV AH,4CH
    INT 21H
    
 MAIN ENDP
END MAIN