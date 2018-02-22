
.section .text
hello:
	.asciz "Hello World\n"
	.set hello_len, .-hello

hello_addr:
	.word hello

.align 4
.global _start
_start:
	mov r0, $1
	ldr r1, hello_addr
	ldr r1, =hello
	mov r2, $hello_len
	ldr r2, =hello_len
	mov r7, $4
	swi $0
	
	mov r0, $0
	mov r7, $1
	swi $0
	

