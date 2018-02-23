.section .text
.align

eol:
	.asciz "\n"

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
	ldr r0, =eol
	bl my_print
	pop {lr}
	bx lr


