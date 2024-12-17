#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <err.h>

int main(void)
{
	int fd0, fd1;
	char buf[143];

	if ((fd0 = open("a.out", O_RDONLY)) == -1)
		err(EXIT_FAILURE, "open()");
	if ((fd1 = open("small.out", O_WRONLY | O_CREAT, S_IRWXU)) == -1)
		err(EXIT_FAILURE, "open()");

        memset(buf, '\0', sizeof(buf));

	/* read first 142 bytes (amount of "unnecessary" bytes)
	   and then write it to a new file. */
        read(fd0, buf, 142);
	write(fd1, buf, 142);
	close(fd0);
	close(fd1);
}
