include 'emu8086.inc'
org 100h

; add your code here
.data
a dw 0
b dw 0
n dw 0
.code
call pthis
db 13,10, 'Enter the number 1:',0 


call scan_num
                             
mov a,cx    
call pthis
db 13,10, 'Enter the number 2:',0 

call scan_num
                             
mov b,cx                                                 
 
call pthis
db 13,10,'The number  is 1: ',0 
mov ax,a   
call print_num
call pthis
db 13,10,'The number  is 2: ',0 
mov ax,b

call print_num 
printn "" 
call pthis                
db 13,10 ,'The quatioent is :',0

divide proc
    push bp
    mov bp, sp
    push bx
    push cx
    push dx

    xor cx, cx
    mov bx, a 
    mov dx, b 

divide_loop:
    cmp bx, dx 
    jb end_divide_loop 

    inc cx 
    sub bx, dx 

    jmp divide_loop 

end_divide_loop:
    mov ax, cx 
    call print_num 

    pop dx
    pop cx
    pop bx
    pop bp
    ret
divide endp

 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end


