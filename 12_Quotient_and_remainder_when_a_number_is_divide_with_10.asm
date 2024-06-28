include 'emu8086.inc'
org 100h

print_menu macro  
    printn
    printn
    call pthis
    db 13,10,'*****Functions of code*****',0
    call pthis
    db 13, 10, '1. Quotient and remainder', 0
    call pthis
    db 13, 10, '2. Exit', 0 
endm

divide_by_10 macro num
    mov ax, num
    xor dx, dx
    mov bx, 10
    div bx
    mov quotient, ax
    mov remainder, dx
endm

.data
num dw 0
quotient dw 0
remainder dw 0

.code


level_3:
print_menu

call pthis
db 13,10, 'Enter your choice:',0 

call scan_num

cmp cl, 1
je level_1
cmp cl, 2
je level_2

level_2:
call pthis 
db 13,10,'You entered 2',0
call pthis
db 13,10,'Exiting the program....',0
mov ah, 4ch  
int 21h

level_1:
call pthis
db 13, 10, 'Enter the number: ', 0
call scan_num
mov num, cx

call pthis
db 13, 10, 'The number is: ', 0
mov ax, num
call print_num

divide_by_10 num

call pthis
db 13, 10, 'The quotient is: ', 0  
mov ax, quotient
call print_num

call pthis
db 13, 10, 'The remainder is: ', 0  
mov ax, remainder
call print_num  
jmp level_3

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end
