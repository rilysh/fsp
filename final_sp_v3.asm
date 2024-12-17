	format elf

section ".text" executable
	public _start

	; 145
	; 143
	; 142
_start:
	mov	al, 4
	mov	ecx, buf
	mov	dl, 11
	int	0x80
	mov	al, 1
	int	0x80

	buf db "Hello world"
