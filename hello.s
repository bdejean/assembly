
.section .text
hello:
	.asciz "Hello World\n"
hello_len = .-hello

hello_addr:
	.word hello

.align 4
.global _start
_start:
	mov r0, $1 #stdout
	# ldr r1, hello_addr
	ldr r1, =hello
	mov r2, $hello_len
	# ldr r2, =hello_len
	mov r7, $4 #syscall
	swi $0

# likewise, but calling strlen instead of hello_len
	push {lr}
	ldr r0, =hello
	bl my_strlen
	pop {lr}

	mov r2, r0
	mov r0, $1
	ldr r1, =hello
	mov r7, $4
	swi $0
	
	mov r0, $0
	mov r7, $1
	swi $0
	

