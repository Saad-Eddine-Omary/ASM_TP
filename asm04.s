global _start

section .data
    odd db "1", 10
    even db "0", 10

section .bss

    x resq  10
    i resb  1
section .text

_start:
    ;scanf
    mov rax, 3;
    mov rbx, 0;stdin
    mov rcx, x;pointer
    mov rdx, 10
    int 80h
    xor rcx,rcx

loop:
    xor r8,r8
    mov r8b, x[ecx]
    cmp r8b, 0x0a
    je clean_buff
    inc ecx
    jmp loop

clean_buff:
    xor r8b, r8b
    xor bl,bl
    mov al, x[ecx-1]
    sub al, 0x30
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

