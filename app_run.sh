#!/bin/bash
set -e

# Define compiler and flags
CC=clang
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32-unknown-elf -fno-stack-protector -ffreestanding -nostdlib"
OBJCOPY=llvm-objcopy

# Build the shell (application)
$CC $CFLAGS -Wl,-Tuser.ld -Wl,-Map=shell.map -o shell.elf shell.c user.c common.c

# Ensure shell.elf exists
if [ ! -f shell.elf ]; then
    echo "shell.elf not found. Build failed!"
    exit 1
fi

# Convert shell.elf to a binary and then to an ELF object
$OBJCOPY --set-section-flags .bss=alloc,contents -O binary shell.elf shell.bin
$OBJCOPY -I binary -O elf32-littleriscv shell.bin shell.bin.o

# Build the kernel
$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf kernel.c common.c shell.bin.o

