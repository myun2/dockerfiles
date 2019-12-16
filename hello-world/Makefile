all:
	gcc -static -nostartfiles -fno-asynchronous-unwind-tables -Os main.c -o main
	strip -R .comment -R .note.gnu.build-id -R .shstrtab -R .eh_frame -R .tbss main
