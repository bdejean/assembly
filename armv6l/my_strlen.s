.align
.global my_strlen
my_strlen:
	mov r1, r0
.loop:
	ldrb r2, [r1], #1
	cmp r2, #0
	bne .loop
	sub r0, r1, r0
	sub r0, r0, #1
	bx lr


