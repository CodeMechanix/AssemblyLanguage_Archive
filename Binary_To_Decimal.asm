INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    IND DW 0
    BASE DB 1,2,4,8,16,32,64,128
    INPUT DB 0
    X DB 10
    Array db 100 DUP(?)
    DAR DB 100 dup(?)
    SUM DB 0 
 
.CODE
 
    MAIN PROC
 
        MOV AX,@DATA        ;FOR DATA SEGMENT
        MOV DS,AX
 
 
  MOV SI,0
;..........Input Function........   

print "Enter Binary Number: "  
    printn
  
Input_Number: 

 MOV AH,1
    INT 21H
    CMP AL,13
    JE Extra
    SUB AL,48
    MOV ARRAY[DI],AL
    INC DI
    JMP Input_Number
 
Extra:
  
    printn
    print "Decimal Number is: "
 
MULTIPLICATION: 

    MOV AH,0
    DEC DI
    CMP DI,0
    JL OTHER
    MOV AL,Array[DI]
    MUL BASE[SI]
    INC SI
    ADD SUM,AL
    JMP MULTIPLICATION
 
 
 
 
OTHER:   

    MOV BX,0  
 
DIVIDE_NUM: 

    MOV AH,0
    MOV AL,SUM
    DIV X
    CMP AL,0
    JE OTHERS_1
    MOV DAR[BX],AH
    INC BX
    MOV SUM ,AL
    JMP DIVIDE_NUM
 
OTHERS_1:   

    MOV DAR[BX],AH
 
FINAL_RESULT:

    CMP BX,0
    JL EXIT
    MOV DL,DAR[BX]
    ADD DL,48
    MOV AH,2
    INT 21H
    DEC BX
    JMP FINAL_RESULT    
 
 
Exit:

    mov ah,4ch
    int 21h 
 
MAIN ENDP
    END MAIN