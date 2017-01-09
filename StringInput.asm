; Displaying  a string

include 'emu8086.inc'   ; you have to write this line 

 PRINTN 'Enter length of string:'
 mov ah,1h
 int 21h

                    ; int 21h means, call the interrupt handler 0x21 which is the DOS Function dispatcher. 
                    ; the "mov ah,01h" is seeting AH with 0x01, which is the Keyboard Input with Echo handler 
                    ; in the interrupt
                    ; je input neya hoise sheta al registor e thake tai porer line e al er element move kora hoise
 printn                 
 
 print "Enter String here: "
 mov cl,al
 sub cl,'0'         ; substract instruction
 mov dl,cl          ; mov means move the content of cl registor to dl 
 mov bx,0
 
 
 p1:
 mov ah,1h
 int 21h            ; again input 
 mov [2000+bx],ax   ; doing a loop by transfering [x+bx] element to ax
 inc bx	            ; incrementing bx regitor
 dec cl
 cmp cl,0           ; comparing  
 jne p1             ; jump to instruction p1    
 
 
 printn
 PRINT 'Inputted string : '
 
 mov cl,dl
 mov bx,0

 output:
 mov dl,[2000+bx]
 mov ah,2h
 int 21h
 inc bx   
 dec cl
 cmp cl,0  
 jne output
 printn     
 
 
 
 mov ax, 4c00h ; return to ms-dos  // essential line 
 int 21h

ret