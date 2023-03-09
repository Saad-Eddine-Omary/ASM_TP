#!/bin/bash
file=$1 
nasm -f elf -o $file/$file.o $file/$file.s
ld -m elf_i386 -o $file/$file $file/$file.o