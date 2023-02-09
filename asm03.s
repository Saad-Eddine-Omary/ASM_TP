global _start

section .bss

section .text
_start:
    pop rax
    mov bl,al
loop:
    pop rax
    mov rcx,rax
    cmp rcx,r10
    je end
    mov rdx,[rcx]
    mov r8, 0x00003234
    mov r9w,dx
    cmp r9,r8
    je end
    cmp rax,rdx
    jne loop

end:
    mov eax,1
    mov ebx,0
    int 80h