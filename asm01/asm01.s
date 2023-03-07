global _start

section .data

    string db "1337", 10

section .text
_start:
    mov eax, 4;sys code for write
    mov ebx, 1;stdout "file descriptor"
    mov ecx, string;the variable
    mov edx, 5;size of the variable (characters + \n)
    int 80h; syscall

    mov eax, 1; return 0
    mov ebx, 0;
    int 80h;