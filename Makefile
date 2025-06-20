# Makefile for CoreOS25

# Target ISO name
ISO_NAME = coreos25.iso

# GRUB directory
GRUB_DIR = boot/grub

all: $(ISO_NAME)

$(ISO_NAME): boot/kernel.bin grub.cfg
	mkdir -p iso/boot/grub
	cp boot/kernel.bin iso/boot/
	cp boot/grub/grub.cfg iso/boot/grub/
	grub-mkrescue -o $(ISO_NAME) iso

boot/kernel.bin: kernel/kernel.c
	i686-elf-gcc -ffreestanding -m32 -c kernel/kernel.c -o kernel/kernel.o
	i686-elf-ld -Ttext 0x1000 -o boot/kernel.bin kernel/kernel.o

clean:
	rm -rf iso
	rm -f boot/kernel.bin kernel/kernel.o $(ISO_NAME)
