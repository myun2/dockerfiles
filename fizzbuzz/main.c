#include <unistd.h>
#include <sys/syscall.h>
void _start() {
	int i=1;
	char c;
	for(; i<100; i++) {
		if (i % 3 == 0)
			syscall(SYS_write, 1, "fizz", 4);
		if (i % 5 == 0)
			syscall(SYS_write, 1, "buzz", 4);
		if (i % 3 != 0 && i % 5 != 0) {
			if (i > 10) {
				c = '0' + i / 10;
				syscall(SYS_write, 1, &c, 1);
			}
			c = '0' + i % 10;
			syscall(SYS_write, 1, &c, 1);
		}
		c = ' ';
		syscall(SYS_write, 1, &c, 1);
	}
	syscall(SYS_exit, 0);
}
