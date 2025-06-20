// kernel/kernel.c
#include <stdint.h>
#include <stddef.h>

void kernel_main() {
    const char *msg = "CoreOS25: Boot successful via USB-C kernel!\n";
    volatile char *video = (volatile char*) 0xB8000; // VGA text buffer
    for (size_t i = 0; msg[i] != '\0'; i++) {
        video[i * 2] = msg[i];
        video[i * 2 + 1] = 0x07; // light grey on black text
    }
    while (1); // Halt
}
