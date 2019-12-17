class String
  def >>(s)
    File.open(s, 'a').tap { |f| f.puts(self) }.close
  end

  def >(s)
    File.open(s, 'w').tap { |f| f.puts(self) }.close
  end
end

$TARGET = "portable.asm"
def label(s); "#{s}:" >> $TARGET; end
def inc(i); "inc #{i}" >> $TARGET; end
def dd(i); "dd #{i}" >> $TARGET; end
def dw(i); "dw #{i}" >> $TARGET; end
def zero(r); "xor #{r}, #{r}" >> $TARGET; end
def add(dest, from); "add #{dest}, #{from}" >> $TARGET; end
def mov(dest, from); "mov #{dest}, #{from}" >> $TARGET; end
def xchg(r1, r2); "xchg #{r1}, #{r2}" >> $TARGET; end
def lea(r1, r2); "lea #{r1}, #{r2}" >> $TARGET; end
def jmp(s); "jmp #{s}" >> $TARGET; end
def db(*a); "db #{a.join(', ')}" >> $TARGET; end
def syscall; "int 0x80" >> $TARGET; end
def _elf; db "0x7F", '"ELF"'; end

def header
  "BITS 32" > $TARGET
    "org 0x00200000" >> $TARGET
    _elf
  label :hello
    db '"Hello world"', '0xa'
    dw 2          # e_type
    dw 3          # e_machine
  label :exit
    zero :ebx     # e_version
    syscall
    dd '_start'   # e_entry
    dd 'phdr - $$' # e_phoff
  label :phdr
    dd 1          # e_shoff  / p_type
    dd 0          # e_flags  / p_offset
    dd '$$'       # e_ehsize / p_vaddr / e_phentsize
    dw 1          # e_phnum  / p_paddr
end

def main
  label :_start
  mov :ecx, '0x00200004'
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
