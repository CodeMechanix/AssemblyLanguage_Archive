; sum = 1+2+3+...+100

XOR AL,AL
MOV CL,1

SUM:
    ADD AL,CL
    INC CL
    CMP CL,101
    JE RESULT

RESULT:
    ; PRINT CL VALUE FIRST CONVERT CL TO DL [ MOV DL,CL]
    JMP EXIT

EXIT:
    ;END


