global _start

section .data
    var db "1337", 10

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
    je good
    cmp rax,rdx
    jne loop
good:
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, var
    mov edx, 5
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
end:
    mov eax,1
    mov ebx,0
    int 80h