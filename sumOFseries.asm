.MODEL SMALL
.STACK 100H
.DATA 
.CODE

    MAIN PROC
        
     MOV CX,100
     MOV AX,1H
     
LEVEL:
    ADD BX,AX
    INC AX
    LOOP LEVEL
                 ;AFTER COMPLETE LOOP BX IS 5050
    MOV AH,4CH
    INT 21H
        
MAIN ENDP
    END MAIN
        
     