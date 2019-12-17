all: main
	./main
portable.asm: port.rb
	ruby port.rb > portable.asm
main: portable.asm
	nasm -f bin -o main portable.asm
	chmod 755 main
	/usr/bin/diff portable.asm example.asm
cp:
	cp portable.asm example.asm
clean:
	rm main portable.asm
