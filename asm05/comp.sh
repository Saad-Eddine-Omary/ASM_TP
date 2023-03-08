#!/bin/bash
file=$1 
nasm -f elf -o $file.o $file.s
ld -m elf_i386 -o $file $file.o