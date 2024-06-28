include 'emu8086.inc' 


print_menu macro 
    
printn
printn
printn
    
call pthis
db 13,10,'The functions of the code are:',0 
call pthis
db 13,10,'1. Accident at Victoria Street (so stop traffic in any one of the two lanes)',0
call pthis
db 13,10,'2. Road works at Holt Street (so stop traffic in any one of the two lanes)',0
call pthis
db 13,10,'3. Traffic Signal malfunction (where all signals are red or green, so display message “drive slowly with caution”)',0

call pthis
db 13,10,'4. Normal traffic condition',0
call pthis
db 13,10,'5. Exit',0
endm                                                                                                                        



org 100h
       

           
; add your code here
.data 
v db 0                   
;                        FEDC BA98 7654 3210
situation4       dw      0000_0011_0000_1100b
s1               dw      0000_0010_1000_1010b
s2               dw      0000_1000_0110_0001b
s3               dw      0000_1000_0110_0001b
s4               dw      0000_0100_0101_0001b  

sit_end = $
situation3       dw      0000_1001_0010_0100b
G1               dw      0000_1001_0010_0100b
sit_end3 = $   

;                        FEDC BA98 7654 3210
situation1     dw        0000_0010_0100_1100b

v1               dw      0000_0010_0100_1010b
v2               dw      0000_1000_0110_0001b
v3               dw      0000_1000_0110_0001b
v4               dw      0000_0100_0101_0001b 
sit_end1 = $ 
situation2       dw      0000_0011_0000_1100b
h1               dw      0000_0010_1000_1010b
h2               dw      0000_1000_0100_1001b
h3               dw      0000_1000_0100_1001b
h4               dw      0000_0100_0100_1001b 
sit_end2 = $ 






all_red          equ     0000_0010_0100_1001b


.code


#start=Traffic_Lights.exe#



level_6:

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
cmp cl,4
  je level_4
cmp cl,5
  je level_5        

                                                                                                                        
                                                                                                                        

level_5:             
       call pthis 
       db 13,10,'You entered 5',0
       call pthis
       db 13,10,'Exiting the programme....',0
       
      ;end 
      mov ah,4ch  
      int 21h




level_4:  

mov bx,0

;

 mov ax, all_red
out 4, ax


mov si, offset situation4


next4:
mov ax, [si]
out 4, ax

 mov     cx, 4Ch    
 mov     dx, 4B40h
 mov     ah, 86h
 int     15h


 add si, 2 ; next situation
 cmp si, sit_end
 jb  next4
 inc bx
 cmp bx,10
 jmp level_6
 mov si, offset situation4
 jmp next4
 






jmp level_6

level_3:   

  mov bx,0

;

 mov ax, all_red
out 4, ax


mov si, offset situation3


next3:
mov ax, [si]
out 4, ax

 mov     cx, 4Ch
 mov     dx, 4B40h
 mov     ah, 86h
 int     15h


 add si, 2 ; next situation
 cmp si, sit_end3
 jb  next3
 inc bx
 cmp bx,10
 jmp level_6
 mov si, offset situation3
 jmp next3
 


 jmp level_6 

level_2:
           
    
mov bx,0

;

 mov ax, all_red
out 4, ax


mov si, offset situation2


next2:
mov ax, [si]
out 4, ax

 mov     cx, 4Ch
 mov     dx, 4B40h
 mov     ah, 86h
 int     15h


 add si, 2 ; next situation
 cmp si, sit_end2
 jb  next2
 inc bx
 cmp bx,10
 jmp level_6
 mov si, offset situation2
 jmp next2
 




;

jmp level_6

level_1:   

  mov bx,0

;

 mov ax, all_red
out 4, ax


mov si, offset situation1


next1:
mov ax, [si]
out 4, ax

 mov     cx, 4Ch    
 mov     dx, 4B40h
 mov     ah, 86h
 int     15h


 add si, 2 ; next situation
 cmp si, sit_end1
 jb  next1
 inc bx
 cmp bx,10
 jmp level_6
 mov si, offset situation1
 jmp next1
 


 jmp level_6 



 







 
ret         

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS
end


