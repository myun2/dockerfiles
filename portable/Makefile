all:
	ruby port.rb
	nasm -f bin -o main portable.asm
	chmod 755 main
	./main
