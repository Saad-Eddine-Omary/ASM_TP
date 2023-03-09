global _start

section .data

    var dw 0, 10

section .bss

    x resq  10

section .text

_start:
    pop eax         ; Get number of args in cmd
    pop eax         ; Get cmd name 

    pop eax         ; Get first number
    mov ecx, [eax]
    mov edx, [eax+2]
    add dx,cx
    cmp dl,0x6a
    jae dec_tens
    sub dl,0x30
    cmp dh,0
    jne decimal_sum
continue:

    mov [var],dx
    


    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, var
    mov edx, 4
    int 80h

    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h

dec_tens:
    sub dl,0x39
    push dl
    mov ecx, [eax]
    mov edx, [eax+2]
    cmp dx,cx
    ja reverse_sub
    sub dx,cx
lab:
    jmp continue

decimal_sum:
    sub dh,0x30

reverse_sub:
    sub cx,dx
    mov dx,cx
    jmp lab