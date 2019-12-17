bits 32
org 0x00200000
db 0x7F, "ELF"
msg:
db "Hello world", 0xa
dw 2
dw 3
exit:
xor ebx, ebx
int 0x80
dd main
dd phdr - $$
phdr:
dd 1
dd 0
dd $$
dw 1
main:
mov ecx, msg
add [ecx], al
lea edx, [edi+12]
inc ebx
lea eax, [edi+4]
int 0x80
xchg ebx, eax
jmp exit
