#include <unistd.h>
#include <sys/syscall.h>
void _start() {
	char buf[256];
	syscall(SYS_read, 0, buf, 256);
	syscall(SYS_write, 1, buf, 256);
	syscall(SYS_exit, 0);
}
