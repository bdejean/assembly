.section .text
.align
hello:
	.asciz "Hello World\n"
.align
hello_len = .-hello

.align
hello_addr:
	.word hello

.section .data
.align
.lcomm buf, 4096


.section .text
.align
.global my_exit
my_exit:
	mov r0, $0
	mov r7, $1
	swi $0


.align
.global _start
_start:
	push {r4, lr}

	mov r0, $1 //stdout
	ldr r1, hello_addr // i don't understand why it works if hello_addr is not aligned
	ldr r1, =hello
	mov r2, $hello_len
	# ldr r2, =hello_len
	mov r7, $4 //syscall
	swi $0

// likewise, but calling strlen instead of hello_len
	ldr r0, =hello
	bl my_strlen

	mov r2, r0 // r0 is the result of strlen
	mov r0, $1
	ldr r1, =hello
	mov r7, $4
	swi $0

	sub sp, sp, #4096
	mov r4, sp

	mov r0, r4
	ldr r1, =hello
	bl my_strcpy
	// returns r0, no need to reload it
	bl my_strchomp
	// returns r0, no need to reload it
	ldr r1, =hello
	bl my_strcat
	// returns r0, no need to reload it
	bl my_print

	mov r0, r4
	bl my_strchomp
	bl my_puts

	add sp, sp, #4096

	pop {r4, lr}
	
	bl my_exit
	

