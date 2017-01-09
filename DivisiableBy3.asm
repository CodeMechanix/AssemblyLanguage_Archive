include 'emu8086.inc'
 
 PRINTN 'Enter Number:: '
 mov ax,0
 mov bh,3

 entry:
 mov ah,01h
 int 21h 
 cmp al,13
 je l1 
 sub al,'0'
 add dl,al 
 loop entry  
 
 l1:
 printn
 mov ah,0
 mov al,dl
 div bh
 cmp ah,0
 je divisiable
 jmp notdivisiable  
 
 divisiable:
 printn 'Number is divisable by 3'
 ret
 
 notdivisiable:
 printn 'Number is not divisable by 3'
 ret
 
ret



