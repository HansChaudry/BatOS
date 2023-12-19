/usr/local/aarch64/bin/aarch64-unknown-linux-gnu-gcc -c boot.s -o boot.o
/usr/local/aarch64/bin/aarch64-unknown-linux-gnu-gcc -std=c99 -ffreestanding -mgeneral-regs-only -c main.c
/usr/local/aarch64/bin/aarch64-unknown-linux-gnu-ld -nostdlib -T link.lds -o kernel boot.o main.o
/usr/local/aarch64/bin/aarch64-unknown-linux-gnu-objcopy -O binary kernel kernel8.img
