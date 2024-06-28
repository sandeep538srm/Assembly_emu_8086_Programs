
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data 
list  db 10h,20h,30h,40h
sum db 0
.code
mov bx,offset list
mov si,offset sum

mov al,0

add al,[bx]
inc bx

add al,[bx]
inc bx

add al,[bx]
inc bx      
      
add al,[bx]

mov [si],al

ret





