all:
	gcc -static -nostartfiles -fno-asynchronous-unwind-tables -Os main.cpp -o main
	strip -R .comment -R .note.gnu.build-id -s main
