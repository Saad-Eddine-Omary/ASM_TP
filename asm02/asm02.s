global _start

section .bss

    x resb  4
section .data

    var db "1337", 10

section .text

_start:
    mov eax, 3;
    mov ebx, 0;stdin
    mov ecx, x;pointer
    mov edx, 5
    int 80h

    mov al, x[0];index in string array, will show in radare2 the ascii 
    cmp al, "4"; 4 between quotes because the input is an ascii value
    jne error

    mov al,x[1]
    cmp al,"2"
    jne error
    
    mov al,x[2]
    cmp al,0
    jne error

    mov eax, 4;
    mov ebx, 1;stdout
    mov ecx, var
    mov edx, 5
    int 80h

    mov eax,1
    mov ebx,0
    int 80h

error:
    mov eax,1
    mov ebx,1
    int 80h

;the following code has a flaw, if the first digit != 4 but the second = 2 it will print 1337
;it does the "next_cmp" even if the first cmp is false 


;    mov al, x[0];index in string array, will show in radare2 the ascii 
;    cmp al, "4"
;    je next_cmp
;
;next_cmp:
;    mov al,x[1]
;    cmp al,"2"
;    je correct
;
;    mov eax,1
;    mov ebx,1
;    int 80h
;
;correct:
;
;    mov eax, 4;
;    mov ebx, 1;stdout
;    mov ecx, var
;    mov edx, 5
;    int 80h
;
;    mov eax,1
;    mov ebx,0
;    int 80h;
