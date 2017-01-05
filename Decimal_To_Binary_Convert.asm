INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    Value DB 0
    X DB 10
    Array db 100 DUP(?)
    Divide_Num DB 2 
 
.CODE
 
    MAIN PROC
 
        MOV AX,@DATA    
        MOV DS,AX
 

print "Enter a Decimal Number: "  ; When you input the number then click "Enter Button" 
    printn 
    
Input_Number: 

  MOV AH,1
    INT 21H
    CMP AL,13
    JE Extra 
    
    SUB AL,48
    MOV CL,AL
    MOV AL,Value
    MUL X
    ADD AL,CL
    MOV Value,AL  
    JMP Input_Number
 
Extra: 

    printn  
    print "Binary Number: "
 
Calculation: 

    MOV AH,0
    MOV AL,Value
    DIV Divide_Num
    MOV Array[DI],AH
    INC DI
    CMP AL,0
    JE RESULT
    MOV Value,AL
    JMP Calculation
 
 
 
RESULT: 

    DEC DI
    CMP DI,0
    JL EXIT
    MOV DL,Array[DI]
    ADD DL,48
 
    MOV AH,2
    INT 21H
    JMP RESULT
 
 
Exit: 

    mov ah,4ch
    int 21h
 
MAIN ENDP
    END MAIN