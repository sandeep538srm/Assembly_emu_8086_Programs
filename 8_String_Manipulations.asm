include 'emu8086.inc'
msg_print macro arg1
    mov dx,offset arg1
    mov ah,09h
    int 21h
endm

print_menu macro
    msg_print lf
    msg_print chc0 
    msg_print lf
    msg_print chc1
    msg_print chc2
    msg_print chc3
    msg_print chc4
    msg_print chc5
    msg_print chc6         
    msg_print lf
    msg_print msg0
endm

Accept macro
    mov ah,01h
    int 21h
endm

string_length macro p1, p8
    local back,go
    mov al,24h
    mov cx,0FFH
    mov si,offset p1
    back: cmp al,[si]
    je go
    inc cl
    inc si
    jmp back
    go: mov p8,cl
endm

concatenate_string macro p1,p2,p3
    lea di,p3
    lea si,p1
    lea bx,first_length
    mov ch,00h
    mov cl,[bx] 
    add cl,1
   
    msg_print first_string
   
    lea si,p2
    lea bx,second_length
    mov ch,00h
    mov cl,[bx]
    add cl,1
    rep movsb
endm

compare_string macro p1,p2
    lea si,p1
    lea di,p2
    lea bx,first_length
    mov cl,[bx]
    rep cmpsb
    jnz not_equal
    equal: msg_print msg15
    jmp exit5
    not_equal:msg_print msg16
    exit5:
endm

code segment
    start: 
   ; print_menu
    msg_print msg9
    msg_print lf
    msg_print msg10
lea di,first_string
call get_string 
msg_print msg8
lea si,first_string
call print_string
msg_print lf
again:
print_menu
accept
mov cl,al
mov bl,al
msg_print msg8
mov dl,cl
mov ah,02
int 21h

case1:
    cmp bl,"1"
    jne case2
    msg_print msg1
    string_length first_string,first_length
    lea si,first_length
    mov ax,cx
    mov dl,cl
    call print_num
    jmp again
case2:
    cmp bl,"2"
    jne case3
   ; msg_print msg3
    call reverse_string
    msg_print msg11
    msg_print first_string
    msg_print msg2
    msg_print reversed_string 
    
    jmp again
case3:
    cmp bl,"3"
    jne case4
    msg_print msg11
    msg_print first_string
  
    msg_print lf
    msg_print msg13
    call scan_num 
    printn       
    mov bl,0
   
    mov bl,cl
   
    mov cl,0

 loop_0:     
         msg_print first_string 
      
         inc cl
         cmp cl,bl
         jl loop_0
 
   
    jmp again
case4:
    cmp bl,"4"
    jne case5
    msg_print msg14
    lea di,second_string
    call get_string
    msg_print msg8
    lea si,second_string
    call print_string
    msg_print msg1
    string_length second_string, second_length
    lea si,second_length
    mov ax,cx
    mov dl,cl
    call print_num
    msg_print msg4
    concatenate_string first_string,second_string,concatenated_string
    msg_print concatenated_string
    jmp again
case5:
    cmp bl,"5"
    jne case6
    msg_print msg14
    lea di,second_string
    call get_string
    msg_print msg8
    lea si,second_string
    call print_string
    string_length first_string, first_length
    msg_print msg5
    compare_string first_string,second_string
    jmp again
case6:
    cmp bl,"6"
    je exit
exit:
    msg_print msg6
    mov ah,4ch
    int 21h
exit2:

reverse_string proc
    mov si,offset first_string

    mov cx, 0h
 
    loop1:
    
    mov ax, [si]
    cmp al, '$'
    je label1
 
    push [si]
 
    inc si
    inc cx
 
    jmp loop1
 
    label1:
  
    mov si, offset  reversed_string
 
        loop2:
      
        cmp cx,0
        je exit3
 
        pop dx
 
        xor dh, dh
 
      
        mov [si], dx

        inc si
        dec cx
 
        jmp loop2
 
                 
    exit3:
    
    mov [si],'$ '
    ret

reverse_string endp


ends 

data1:
lf1 db 10,13
first_string db 25 dup('$')
first_length db ?
reversed_string db 25 dup('$')
repeated_times db ?
repeated_string db 100 dup('$')
second_string db 25 dup("$")
second_length db ?
concatenated_string db 100 dup('$')

msg9 db 0dh,0ah, "This program manipulates string :$"
msg10 db 0dh,0ah, "Enter A String :$"
msg11 db 0dh,0ah, "The Original String is :$"
msg12 db 0dh,0ah, "How many times you want to repeat the string:$"
msg13 db 0dh,0ah, "Enter a Number for How many time to repete the given string : $"
msg14 db 0dh,0ah, "Enter a Second String :$"
msg15 db 0dh,0ah, "Same $"
msg16 db 0dh,0ah, "Different $"
msg0 db 0dh,0ah, "Enter A Choice(1/2/3/4/5/6): $"
msg1 db 0dh,0ah, "String length is : $"
msg2 db 0dh,0ah, "Reversed String is : $"
msg3 db 0dh,0ah, "The original String is Repeated N times$"
msg4 db 0dh,0ah, "Concatenated the Second String with first String and it is :$"
msg5 db 0dh,0ah, "Compared two Strings and they are : $ "
msg6 db 0dh,0ah, "Exiting the program. $"
msg8 db 0dh,0ah, "You Entered : $ "

lf db 10,13,"$"
chc0 db 0dh,0ah, "Choose a String function to be performed: $"
chc1 db 0dh,0ah, "1.Find String Length $"
chc2 db 0dh,0ah, "2.Reverse the String $"
chc3 db 0dh,0ah, "3.Repeat the string N times and save it $"
chc4 db 0dh,0ah, "4.Concatenate the string with another string and save it:$"
chc5 db 0dh,0ah, "5.Compare two strings to chech wether they are same or different  : $"
chc6 db 0dh,0ah, "6.Exit $"

define_get_string
define_print_string
define_print_num
define_print_num_uns
define_scan_num
end