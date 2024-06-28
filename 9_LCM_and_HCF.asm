include 'emu8086.inc'
org 100h

; add your code here
.data
a db 0
b db 0
lcm db ? 
.code
call pthis
db 13,10, 'Enter the number 1: ',0 

;call print_string
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
mov cx,0

mov ax,@data
mov ds,ax
mov ah,0
mov al,a
mov bl,b
div bl
cmp ah,0 
je exit
jne l1
l1:
mov ah,0
mov al,bh
add al,a
mov bh,al
div bl
cmp ah,0 
je exit
jne l1 
exit:   
mov lcm,bh   
mov dl,lcm 
mov al,dl   
printn
print "LCM of given numbers is "
cALL PRINT_NUM_uns 

mov lcm,al
mov al,a
mov bl,b
mul bl
mov cl,lcm
div cl
mov ah,0 
printn
print "GCD of the given numbers is "
call print_num_uns 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end
