include 'emu8086.inc'   

 printn 'Enter length of array ::'
 
 mov ah,01h
 int 21h 
 
 printn 
 
 
 mov dl,al
 sub dl,48  
 
        
 mov cl,dl          
 mov bx,0
 
 print "Enter number here: "
 
 input:
 
 mov ah,01h
 int 21h 
            
 mov [bx],al    
 inc bl	                       
 loop input
 
 mov cl,bl
 mov bl,0  

 mov dl,[bx] 

Checkloop: 
 
 cmp dl,[bx]
 jl Maximum 
 
 Level:
     inc bl
     loop Checkloop
     
     jmp Final
 
 Maximum:
    mov dl,[bx]
    
   jmp Level
  


 Final:     
        
   printn
   print "Maximum number :: "     
   
   mov ah,2h
   int 21h
   
   mov ah, 4ch   
   int 21h

ret



