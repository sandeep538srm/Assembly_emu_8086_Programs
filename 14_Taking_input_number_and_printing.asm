include 'emu8086.inc'
ORG 100h

call pthis
db 13,10, 'Enter the number: ',0 

;call print_string
call scan_num
                             
                             
mov ax,cx

call pthis
db 13,10,'The number is: ',0 
call print_num
ret
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end