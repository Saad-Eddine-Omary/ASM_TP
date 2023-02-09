#!/bin/bash
nasm -f elf64 -o $1 $2
ld -s -o $3 $1
