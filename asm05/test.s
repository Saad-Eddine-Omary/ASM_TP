global _start
section .data

    result dd 0, 10

section .text

_start:
    pop eax             ; Get number of args in cmd
    pop eax             ; Get cmd name 

    pop eax             ; Get first number
    mov ecx, [eax]

    pop eax       ; Store first number in ecx
    mov edx, [eax]    ; Store second number in edx


    add dx,cx
    sub dl,0x30
    cmp dl,0x3a
    jl _2digitsum

    sub dl,0xa
    mov dh,0x31
    xchg dh,dl
    
    mov [result],dx
    ;print
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, result
    mov edx, 5
    int 80h
    jmp end


_2digitsum
    mov [result],dx
    ;print
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, result
    mov edx, 5
    int 80h
end:
    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h
