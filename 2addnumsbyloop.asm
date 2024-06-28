
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include "emu8086.inc"
org 100h

; add your code here   
.data
list db 10h,20h,30h,40h
sum db 0   
string db 'The of 4 numbers is ' ,'$' 
.code

mov bx, offset list ;pointing bx to list starting index

mov al,[bx]  ;al=10h 

mov cl,0; loop counter ,initilized to 0
loop_1:
      inc bx
      add al,[bx]
      inc cl 
      
      cmp cl,2 ;compares counter value with 3
      
      jl loop_1 
mov bx,offset sum
mov [bx],al 
mov dx,offset string
mov ah,09h
  
int 21h   

mov dl,al
int 02h
 

;mov dl,0

;add dl,48d
;mov ah,02h
;int 21h  

ret




