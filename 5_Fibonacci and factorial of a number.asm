include 'emu8086.inc' 


print_menu macro 
    
printn
printn
printn
    
call pthis
db 13,10,'*****THE CODE WORK FOR THESE FUNCTIONS*****',0 
printn
call pthis
db 13,10,'1. To display Fibonacci number sequence up to nth term.',0
call pthis
db 13,10,'2. To find the factorial of a number.',0
call pthis 
db 13,10,'3.EXIT',0
endm                                                                                                                        



org 100h
       

           
; add your code here
.data
n db 0
a db 0
b db 0  
v db 0
x db 1
y db 2
z db 3
.code






level_4:

print_menu



call pthis
db 13,10, 'Enter your choice:',0 

call scan_num
                             
mov v,cl

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
db 13,10, 'Enter the number for factorial :',0 

call scan_num
                             
mov n,cl  
                                                     
 
call pthis
db 13,10,'The number  is: ',0 
mov al,n
call print_num 
printn ""
mov bh,n
mov dl,n 
mov al,1
mov cl,0
loop_1:

           
   mul bh
   dec bh
   inc cl
   
   cmp cl,dl
   
   jl loop_1
call pthis
db 13,10,'The factoral of number is:',0
call print_num   
mov n,0
jmp level_4

level_1:
call pthis
db 13,10, 'Enter the number for fibnacci series:',0 

call scan_num
                             
mov n,cl  
                                                     
 
call pthis
db 13,10,'The number  is: ',0 
mov al,n
call print_num 
printn "" 
call pthis
db 13,10 ,'The Fibonacci number sequence up to:',0
call print_num
printn 13
mov al,0
call print_num
printn 13
mov al,1
;call print_num
printn 13     
mov dh,cl
dec dh
;dec dh
mov cl,0
loop_2:

   add al,a,b
   call print_num
   printn 13
   
   mov dl,b 
   
   mov bx,offset b
   mov [bx],al
   
   mov bx,offset a
   mov [bx],dl
   
   inc cl
   
   cmp cl,dh
   
   jl loop_2
   
mov a,0
mov b,0
mov n,0

 jmp level_4
 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end