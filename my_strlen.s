.align 4
.global my_strlen
my_strlen:
	mov r4, r0
.loop:
	ldrb r5, [r4], #1
	cmp r5, #0
	bne .loop
	sub r0, r4, r0
	bx lr


