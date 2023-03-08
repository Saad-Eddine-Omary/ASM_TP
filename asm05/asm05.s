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
    rol ecx, 1
sum:
    ;sub ecx,0x30
    ;sub edx,0x30
    add ecx, edx
    add ecx, '0'
    ;dec edx
    ;and dl,0xf
    ;jne sum
    bswap ecx
    mov edx,ecx
    bswap ecx
    mov [result],ecx
    ;print
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, result
    mov edx, 2
    int 80h
    

    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h


convert:
    cmp dl,0x00
    je end
    cmp dl,0x6a
    jae above9

above9:
    
end:
    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h