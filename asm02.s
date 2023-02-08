global _start

section .data

    string db "42",0

section .text

_start:
    mov al,1
    cmp 1,1 ; 
    je 
    mov eax, 3;
    mov ebx, 0;stdin
    mov ecx, 