BITS 32
org 0x00200000
db 0x7F, "ELF"
hello:
db "Hello world", 0xa
dw 2
dw 3
exit:
xor ebx, ebx
int 0x80
dd start
dd phdr - $$
phdr:
dd 1
dd 0
dd $$
dw 1
start:
mov ecx, hello
add [ecx], al
lea edx, [edi+0xd]
inc ebx
lea eax, [edi+4]
int 0x80
xchg ebx, eax
jmp exit
