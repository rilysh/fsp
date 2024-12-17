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
;; Before stripping 
;; wc -c a.out
;; 8776 a.out
;; After stripping
;; wc -c a.out
;; 8488 a.out
