.align 2
.global my_strcpy
my_strcpy:
	sub r2, r0, #1
.loop:
	ldrb r3, [r1], #1
	cmp r3, #0
	strb r3, [r2, #1]!
	bne .loop
	bx lr


