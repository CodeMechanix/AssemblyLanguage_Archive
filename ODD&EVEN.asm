.MODEL SMALL
.STACK 100H
.DATA
.CODE

    MAIN PROC
        
        MOV AH,01H
        INT 21H
        
        AND AL,0FH
        
        TEST AL,1
        JZ EVEN
        JMP ODD
        
EVEN:
    MOV DL,'E'
    JMP BELOW
ODD:
    MOV DL,'O'
    
BELOW:
    MOV AH,02H
    INT 21H
    
  MOV AH,4CH
  INT 21H