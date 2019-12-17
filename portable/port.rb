def label(s); puts "#{s}:"; end
def db(*a); puts "db #{a.join(', ')}"; end
def syscall; puts "int 0x80"; end
def _elf; db "0x7F", '"ELF"'; end
def method_missing(name, *args); return if name == :to_str || name == :to_ary; puts "#{name} #{args.join(', ')}"; end

def header
  BITS 32
  org '0x00200000'
  _elf
  label :hello
    db '"Hello world"', '0xa'
    dw 2           # e_type
    dw 3           # e_machine
  label :exit
    xor :ebx, :ebx # e_version
    syscall
    dd :start     # e_entry
    dd 'phdr - $$' # e_phoff
  label :phdr
    dd 1           # e_shoff  / p_type
    dd 0           # e_flags  / p_offset
    dd '$$'        # e_ehsize / p_vaddr / e_phentsize
    dw 1           # e_phnum  / p_paddr
end

def main
  label :start
  mov :ecx, :hello
  add '[ecx]', :al
  lea :edx, '[edi+0xd]'
  inc :ebx
  lea :eax, '[edi+4]'
  syscall
  xchg :ebx, :eax
  jmp :exit
end

header
main
