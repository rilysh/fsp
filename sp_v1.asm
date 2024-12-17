	format elf64

section ".text" executable
	public _start

_start:
	mov	rax, 1
	mov	rdi, 1
	lea	rsi, [buf]
	mov	rdx, 11
	syscall
	mov	rax, 60
	mov	rdi, 0
	syscall

section ".data"
	buf db "Hello world"

;; *** Output ***
; Same as sp_v0
