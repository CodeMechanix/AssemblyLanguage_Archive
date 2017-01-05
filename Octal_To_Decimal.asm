INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    IND DW 0
    BASE DB 1,8,64
    INPUT DB 0
    X DB 10
    ARRAY db 100 DUP(?)
    DAR DB 100 dup(?)
    SUM DB 0 
 
.CODE
 
    MAIN PROC
 
        MOV AX,@DATA        ;FOR DATA SEGMENT
        MOV DS,AX
 
 
  MOV SI,0
;----------As a Input Function--------- 
print "Enter a Octal Number less than 377: "   
INPUT_LABEL:
MOV AH,1
    INT 21H
    CMP AL,13
    JE print_comment
    SUB AL,48            ;First input the number as an array
    MOV ARRAY[DI],AL
    INC DI
    JMP INPUT_LABEL
 
 
;-------------------------
print_comment:
    printn  
    printn
    print "Answer in Decimal is: "
 
MULTIPLICATION:
    MOV AH,0             
    DEC DI
    CMP DI,0
    JL OTHER
    MOV AL,ARRAY[DI]     ;then convert the number in decimal from array
    MUL BASE[SI]
    INC SI
    ADD SUM,AL
    JMP MULTIPLICATION
 
;-------------------------            
OTHER:
    MOV BX,0  
                           ;store the decimal number in array
DIVIDE:
    MOV AH,0
    MOV AL,SUM
    DIV X  ;divide decimal number for create individual number            
    CMP AL,0
    JE NEXT
    MOV DAR[BX],AH
    INC BX
    MOV SUM ,AL
    JMP DIVIDE
;------------------------------    
NEXT:
    MOV DAR[BX],AH
 
FINAL_RESULT:
    CMP BX,0
    JL EXIT
    MOV DL,DAR[BX]
    ADD DL,48          ;Finally print the Decimal number from array by reversing
    MOV AH,2
    INT 21H
    DEC BX
    JMP FINAL_RESULT    
 
 
exit:
    mov ah,4ch
    int 21h 
 
MAIN ENDP
    END MAIN