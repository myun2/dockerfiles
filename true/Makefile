all:
	gcc -static -nostartfiles -fno-asynchronous-unwind-tables -Os main.cpp -o main
	strip -R .shstrtab -R .comment -R .note.gnu.build-id -R .shstrtab -R .eh_frame -R .tbss main
