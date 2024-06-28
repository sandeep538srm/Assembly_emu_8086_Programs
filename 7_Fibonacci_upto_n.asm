include 'emu8086.inc'
org 100h

; add your code here
.data
a db 0
b db 1
n db 0
.code
call pthis
db 13,10, 'Enter the number:',0 

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

call print_num
printn 13     
mov dh,cl
dec dh
dec dh
mov cl,0
loop_1:

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
   
   jl loop_1
   
 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end


