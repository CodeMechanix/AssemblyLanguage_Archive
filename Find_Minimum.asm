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
 jg Minimum 
 
 Level:
     inc bl
     loop Checkloop
     
     jmp Final
 
 Minimum:
   mov dl,[bx] 
   jmp Level
  


 Final:     
        
   printn
   print "Minimum number :: "     
   
   mov ah,2h
   int 21h
   
   mov ah, 4ch   
   int 21h

ret



