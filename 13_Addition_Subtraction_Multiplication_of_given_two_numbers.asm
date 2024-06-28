include 'emu8086.inc'
org 100h

print_menu macro 
 
printn
printn
call pthis
db 13,10,'This code works for following functions',0    

printn
printn
 
call pthis
db 13,10, '1. Addition of Two numbers.',0
call pthis
db 13,10, '2. Subtraction of two numbers. ',0
call pthis
db 13,10, '3.Multiplication of two numbers. ',0
call pthis
db 13,10, '4. Exit.',0 

endm  

.data
a dw 0
b dw 0 
c db 0
sum dw 0
subt dw 0
mult dw 0 
.code

level_5:


print_menu



call pthis
db 13,10, 'Enter your choice:',0 

call scan_num
mov c,cl                             

call pthis
db 13,10, 'Your choice is:',0 
mov al,cl
call print_num    
cmp cl,4
je level_4

call pthis
db 13,10, 'Enter the number 1: ',0 

call scan_num
                             
mov a,cx  

call pthis
db 13,10, 'Enter the number 2: ',0 

call scan_num
                             
mov b,cx                                                          

call pthis
db 13,10,'The number 1 is: ',0 
mov ax,a
call print_num 

call pthis
db 13,10,'The number 2 is: ',0 
mov ax,b
call print_num
mov cl,c  



cmp cl,1
  je level_1
cmp cl,2
  je level_2
cmp cl,3
  je level_3
cmp cl,4
je level_4    
                                                                                                                                                        

level_4:             
       call pthis
       db 13,10,'Exiting the programme....',0
       
      ;end 
      mov ah,4ch  
      int 21h
level_3:  
           call pthis
db 13,10, 'The Multiplication of given two numbers is :',0
      mov ax,a
      mul b
      mov mult,ax
      call print_num
    
    jmp level_5      

level_2:  
      call pthis
db 13,10, 'The subtraction of given two numbers is :',0
      mov ax,a
      sub ax,b
      mov subt,ax
      call print_num
       jmp level_5

level_1: 
     
call pthis
db 13,10, 'The sum of given two numbers is :',0
add ax,a,b
mov sum,ax 
call print_num

   jmp level_5  
   
 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end