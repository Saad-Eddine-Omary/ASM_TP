global _start

section .bss

    x resb  4

section .text
_start:
    ;scanf
    mov eax, 3;
    mov ebx, 0;stdin
    mov ecx, x;pointer
    mov edx, 5
    int 80h

    mov eax,[ecx]
    mov ebx, 2
    div ebx
    cmp ah, 0
    jne odd

    mov eax,1
    mov ebx,0
    int 80h


odd:
    mov eax,1
    mov ebx,1
    int 80h
