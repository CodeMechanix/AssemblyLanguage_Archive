; Convert 5000sec in hour,minute,second 
 
MOV AX,5000
MOV DL,60
DIV DL
; print ah ->Its Show Second
XOR AH,AH
DIV DL
; print ah ->Its Show Minute
; print al ->Its Show Hour