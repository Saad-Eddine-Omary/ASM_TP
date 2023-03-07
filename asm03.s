global _start

section .data
    var db "1337", 10

section .text

_start:
    pop eax
    mov bl,al   ;number of args in cmd

get_arg:

    pop eax
    mov ecx, [eax]
    sub bl,1
    cmp cx, 0x3234
    je check  
    cmp bl,0
    jne get_arg

end:            ;Return 1
    
    mov eax,1
    mov ebx,1
    int 80h

check: 

    bswap ecx   ;swap high and low bits and inverts them
    cmp ch, 0
    je good
    cmp bl,0 ;In case the number is for example 42X and is the last arg, it will come to the check 
             ;and jump back to the start since ch isnt 0 and will cause a core dump. 
             ;This fixes this problem
    je end
    jmp get_arg

good:           ;Print 1337

    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, var
    mov edx, 5
    int 80h
    
    mov eax,1   ;Return 0
    mov ebx,0
    int 80h