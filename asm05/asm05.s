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
 
    cmp ch,0
    jne checknb2        ;jumps if nb is 2 digits

    cmp dh,0
    jne sum1to2

    add dx,cx
    sub dl,0x30
    cmp dl,0x3a
    jl end_1

    sub dl,0xa
    mov dh,0x31
    xchg dh,dl
    jmp end_1
    
    

checknb2:
    cmp dh,0
    jne _2digitnb       ;if 2 digit nb jumps to 2 digits numbers sum 
    xchg dh,dl
    jmp sum

sum1to2:
    xchg ch,cl
    jmp sum

sum: 
    add dx,cx
    sub dh,0x30
    cmp dh,0x3a
    jl end_1
    sub dh,0xa
    add dl,0x01
    cmp dl,0x3a
    jl end_1
    mov dl,0x31
    mov bl,dh
    mov dh,0x30
    bswap edx
    mov dh,bl
    mov dl,0
    bswap edx
    jmp end

_2digitnb:
    add dx,cx
    sub dx,0x3030


    cmp dl,0x3a
    jae cleanl

    cmp dx,0x3a39
    jl clean

    cmp dx,0x3a39
    je cleanhto100

    cmp dh,0x3a
    jae cleanhto3

cont:

    cmp dh,0x3a
    jae cleanh

    mov dl,0
    bswap edx
    mov dx,ax
    jmp end
    ;mov bl,dh
    ;mov dh,0x31
    ;xchg dh,dl
;
    ;bswap edx
    ;mov dh,0x31
    ;bswap edx
    ;mov ax,dx
    ;mov dh,bl
    ;mov dl,0
    ;bswap edx
    ;mov dx,ax

clean:

    bswap edx
    mov dx,0
    bswap edx
    jmp end

cleanl:

    sub dl,0xa
    mov bl,dh
    mov dh,0x31
    xchg dh,dl
    bswap edx
    mov dh,0x31
    bswap edx
    mov ax,dx

    mov dh,bl
    jmp cont

cleanh:
    sub dh,0xa
    mov dl,0
    bswap edx
    mov bl,dh
    mov dx,ax
    add dh,bl
    sub dh,0x30
    jmp end

cleanhto3:
    sub dh,0xa
    mov bl,dh
    bswap edx
    mov dh,bl
    mov dl,0
    bswap edx
    mov dx,0x3031
    jmp end

cleanhto100:
    sub dh,0xa
    mov bl,dh
    bswap edx
    mov dh,bl
    mov dl,0
    bswap edx
    mov dx,0x3031
    jmp end

end:

    mov [result],edx
    ;print
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, result
    mov edx, 5
    int 80h

    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h

end_1:

    mov [result],dx
    ;print
    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, result
    mov edx, 5
    int 80h

    mov eax, 1          ; Return 0
    mov ebx, 0
    int 80h