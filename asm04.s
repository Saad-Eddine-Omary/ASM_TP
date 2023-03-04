global _start

section .data
    odd db "1", 10
    even db "0", 10

section .bss

    x resq  4

section .text

_start:
    ;scanf
    mov rax, 3;
    mov rbx, 0;stdin
    mov rcx, x;pointer
    mov rdx, 5
    int 80h

    mov rcx, [rcx]
    sub cl, 0x30
    cmp ch, 0x0a
    je clean_buff



clean_buff:
    xor ch,ch
    xor bl,bl
    mov al, cl
    mov bl, 0x02
    div bl
    cmp ah,0
    jne _odd
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, even
    mov edx, 2
    int 80h

    mov eax, 1; return 0
    mov ebx, 0;
    int 80h;


_odd:
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, odd
    mov edx, 2
    int 80h



    mov eax, 1; return 0
    mov ebx, 0;
    int 80h;

