.section .text

.align
.global my_print
my_print:
	push {r4, lr}
	mov r4, r0
	bl my_strlen
	mov r2, r0
	mov r0, $1
	mov r1, r4
	mov r7, $4
	swi $0
	pop {r4, lr}
	bx lr


.align
.global my_puts
my_puts:
	push {lr}
	bl my_print

	sub sp, sp, #8
/*
	mov r1, #'\n'
	strb r1, [sp]
	mov r1, #'\0' // BUG?: loads '0' instead of '\0'
	mov r1, #0
	strb r1, [sp, #1]
*/
	mov r1, #'\n'
	str r1, [sp] // or strh

	mov r0, sp

	bl my_print

	add sp, sp, #8

	pop {lr}
	bx lr


