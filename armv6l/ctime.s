/*
	calls time()
	then ctime()
	and prints it using fputs() on stdout
*/

.extern stdout
.align
.global	main
main:
	push {r4, lr}
	sub sp, sp, #12

	mov r0, sp
	bl time

	mov r0, sp
	bl ctime

	cmp r0, #0
	moveq r0, #1
	beq .out

	// double load to follow PLT
	ldr r2, =stdout
	ldr r1, [r2]

	bl fputs

	mov r0, $0
.out:
	add sp, sp, #12
	pop {r4, lr}
	bx lr

