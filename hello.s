.section .text
.align
hello:
	.asciz "Hello World\n"
hello_len = .-hello

hello_addr:
	.word hello

.section .data
.align 2
.lcomm buf, 4096


.section .text
.align 2
.global my_exit
my_exit:
	mov r0, $0
	mov r7, $1
	swi $0


.global _start
_start:
	push {lr}

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


	ldr r0, =buf
	ldr r1, =hello
	bl my_strcpy
	// returns r0, no need to reload it
	bl my_strchomp
	// returns r0, no need to reload it
	ldr r1, =hello
	bl my_strcat
	// returns r0, no need to reload it
	bl my_print

	ldr r0, =buf
	bl my_strchomp
	bl my_puts

	pop {lr}
	
	bl my_exit
	

