#!/bin/bash
nasm -f elf -o $1 $2
ld -m elf_i386 -o $3 $1
