# http://shinh.skr.jp/binary/fsij061115/
# http://shinh.skr.jp/binary/fsij061115/hello65.asm
; hello65.asm

BITS 32
        org     0x00200000
        db      0x7F, "ELF"             ; e_ident
hello:
        db      "Hello world", 0xa
        dw      2                       ; e_type
        dw      3                       ; e_machine
exit:   xor     EBX, EBX                ; e_version
        int     0x80
        dd      _start                  ; e_entry
        dd      phdr - $$               ; e_phoff
phdr:   dd      1                       ; e_shoff       ; p_type
        dd      0                       ; e_flags       ; p_offset
        dd      $$                      ; e_ehsize      ; p_vaddr
                                        ; e_phentsize
        dw      1                       ; e_phnum       ; p_paddr
_start:
        mov     ECX, 0x00200004                         ; p_filesz
        add     [ECX], AL                               ; p_memsz
        lea     EDX, [EDI+0xd]
        inc     EBX                                     ; p_flags
        lea     EAX, [EDI+4]
        int     0x80                                    ; p_align
        xchg    EBX, EAX
        jmp     exit
