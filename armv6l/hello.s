.section .text
.align
hello:
	.asciz "Hello World\n"
.align
hello_len = .-hello

.align
.global _start
_start:
	push {lr}

	mov r0, $1 //stdout
	ldr r1, =hello
	mov r2, $hello_len
	mov r7, $4 //syscall
	swi $0

	mov r0, $0
	mov r7, $1
	swi $0

	pop {lr}

