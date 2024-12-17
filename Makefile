TCC=./tcc-0.9.27+git20200814.62c30a4a/tcc
FASM=./fasm-1.73.30/fasm
CC?=gcc

all:
	${FASM} final_sp_v3.asm
	${TCC} final_sp_v3.o -m32 -nostdlib -static
	strip -R .preinit_array a.out
	strip -R .init_array a.out
	strip -R .fini_array a.out
	strip -R .data a.out

# Note: Apparently TinyCC (version 0.9.27 i386 Linux) gets stuck
# in a deadloop when trying to compile a C file to object file.
# So we'll use whatever the default compiler system has (as cc)
# otherwise we'll fall-back to GCC.
	${CC} discard_offset.c -o discard_offset

	./discard_offset
	rm -f a.out
	mv -f small.out a.out

# Cleanup
	rm -f discard_offset *.o

clean:
	rm -f discard_offset *.o *.out
