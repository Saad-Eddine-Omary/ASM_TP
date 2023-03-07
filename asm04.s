global _start

section .data
    
    even db "0", 10
    odd db "1", 10

section .bss

    x resq  10

section .text

_start:
    ; Scanf
    mov rax, 3
    mov rbx, 0          ; Stdin
    mov rcx, x          ; Pointer
    mov rdx, 10
    int 80h
    xor rcx,rcx

loop:

    xor r8,r8
    mov r8b, x[ecx]     ; Iterates through the inputed number
    cmp r8b, 0x0a       ; Check for end of input with an "enter" ascii value
    je clean_buff
    inc ecx
    jmp loop

clean_buff:

    xor r8b, r8b
    xor bl,bl
    mov al, x[ecx-1]
    sub al, 0x30        ; Get decimal values
    mov bl, 0x02
    div bl
    cmp ah,0
    jne _odd

    ; Print 0 to have a visual of the return
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, even
    mov edx, 2
    int 80h
    
    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h


_odd:
    ; Print 1 to have a visual of the return
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, odd
    mov edx, 2
    int 80h



    mov eax, 1; return 0
    mov ebx, 1;
    int 80h;
