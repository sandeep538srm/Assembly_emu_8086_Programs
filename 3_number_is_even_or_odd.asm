include 'emu8086.inc'
org 100h
print_menu macro  
    printn
    printn
    call pthis
    db 13,10,'*****Functions of code*****',0
    call pthis
    db 13, 10, '1.For Even or Odd', 0
    call pthis
    db 13, 10, '2.Exit ', 0 
endm

find macro p1
    mov bl, p1
    MOV dx, 0000
    MOV bh, 00
    MOV bl, 02H  
    DIV bx
    CMP dx, 0     
    JE even
    JNE odd
endm

.data
a db 0

.code


level_3:
print_menu



call pthis
db 13,10, 'Enter your choice:',0 

call scan_num
                             
cmp cl,1
  je level_1
cmp cl,2
  je level_2

level_2:
 call pthis 
       db 13,10,'You entered 2',0
       call pthis
       db 13,10,'Exiting the programme....',0
      mov ah,4ch  
      int 21h

level_1:
call pthis
db 13, 10, 'Enter the number: ', 0
call scan_num
mov a, cl

call pthis
db 13, 10, 'The number is: ', 0
mov al, a
call print_num
find a

even:
    printn
    call pthis
    db 13, 10, 'The number is Even', 0   
    jmp level_3

odd:
    printn
    call pthis
    db 13, 10, 'The number is odd', 0 
    jmp level_3

ret

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end
