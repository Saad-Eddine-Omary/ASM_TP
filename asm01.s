global _start

section .data

    string db "1337", 10

section .text
_start:
    mov eax, 4;
    mov ebx, 1;
    mov ecx, string;
    mov edx, 5;
    int 80h;

    mov eax, 1;
    mov ebx, 0;
    int 80h;