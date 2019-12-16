#include <unistd.h>
#include <sys/syscall.h>
void _start() {
	syscall(SYS_write, 1, "hello world!\r\n", 14);
	syscall(SYS_exit, 0);
}
