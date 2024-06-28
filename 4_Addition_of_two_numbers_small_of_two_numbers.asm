include 'emu8086.inc'
org 100h

print_menu macro 
    
;printn
printn
printn
 
call pthis
db 13,10, '1. Addition of Two numbers.',0
call pthis
db 13,10, '2. Compare and tell which number is smaller.',0

call pthis
db 13,10, '3. Exit.',0 

endm  
; add your code here
.data
a db 0
b db 0 
c db 0
sum db 0 
.code

level_4:

printn
printn
call pthis
db 13,10,'This code works for following functions',0

print_menu



call pthis
db 13,10, 'Enter your choice:',0 

call scan_num
mov c,cl                             

call pthis
db 13,10, 'Your choice is:',0 
mov al,cl
call print_num 


cmp cl,1
  je level_1
cmp cl,2
  je level_2
cmp cl,3
  je level_3
                                                                                                                                                            

level_3:             
       call pthis 
       db 13,10,'You entered 3',0
       call pthis
       db 13,10,'Exiting the programme....',0
       
      ;end 
      mov ah,4ch  
      int 21h

level_2:
call pthis
db 13,10, 'Enter the number 1: ',0 

call scan_num
                             
mov a,cl  

call pthis
db 13,10, 'Enter the number 2: ',0 

call scan_num
                             
mov b,cl                                                          

call pthis
db 13,10,'The number 1 is: ',0 
mov al,a
call print_num 

call pthis
db 13,10,'The number 2 is: ',0 
mov al,b
call print_num
mov bl,a
mov bh,b
cmp bl,bh
je equal
cmp bl,bh      
jg greater
cmp bl,bh     
jmp lesser       
  jmp level_4 
greater:
call pthis
db 13,10,'The lesser number is ',0
mov al,b
call print_num
jmp level_4
lesser:
call pthis
db 13,10,'The lesser number is ',0
mov al,a
call print_num
jmp level_4
equal:
call pthis
db 13,10,'Both are equal',0
jmp level_4


level_1: 
     
     call pthis
db 13,10, 'Enter the number 1: ',0 

call scan_num
                             
mov a,cl  

call pthis
db 13,10, 'Enter the number 2: ',0 

;call print_string
call scan_num
                             
mov b,cl                                                          

call pthis
db 13,10,'The number 1 is: ',0 
mov al,a
call print_num 

call pthis
db 13,10,'The number 2 is: ',0 
mov al,b
call print_num   

call pthis
db 13,10, 'The sum of given two numbers is :',0
;mov al,0;
add al,a 
call print_num

   jmp level_4  
   
 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end
