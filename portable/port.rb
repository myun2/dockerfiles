def label(s); puts "#{s}:"; end
def syscall; puts "int 0x80"; end
def _elf; db "0x7F", '"ELF"'; end
def method_missing(name, *args); return if name == :to_str || name == :to_ary; puts "#{name} #{args.join(', ')}"; end

MSG = "Hello world"

def msg
  label :msg
  db "\"#{MSG}\"", '0xa'
end

def sysexit
  label :exit
  xor :ebx, :ebx # e_version
  syscall
end
def exit; jmp :exit; end

def header(params)
  bits params[:bits]
  org  params[:org]
  _elf
  msg
  dw 2 # e_type
  dw 3 # e_machine
  sysexit
  dd params[:entry]
  dd 'phdr - $$' # e_phoff
  label :phdr
  dd 1    # e_shoff  / p_type
  dd 0    # e_flags  / p_offset
  dd '$$' # e_ehsize / p_vaddr / e_phentsize
  dw 1    # e_phnum  / p_paddr
end

def _print(msg, size)
  mov :ecx, msg
  add '[ecx]', :al
  lea :edx, "[edi+#{size}]" # size
  inc :ebx              # stdout(1)
  lea :eax, '[edi+4]'   # write
  syscall
  xchg :ebx, :eax
  exit
end

header bits: 32,
       org: '0x00200000',
       entry: :main
label(:main)
_print(:msg, 12)
