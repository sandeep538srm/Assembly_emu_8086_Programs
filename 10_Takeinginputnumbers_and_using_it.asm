include 'emu8086.inc'
ORG 100h
.data
 a dw 0
 b dw 0
 gcd dw 0
.code
call pthis
db 13,10, 'Enter the number 1: ',0 

;call print_string
call scan_num
                             
mov a,cx  

call pthis
db 13,10, 'Enter the number 2: ',0 

;call print_string
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
mov cx,0


mov ax,a
mov bx,b









ret
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end

