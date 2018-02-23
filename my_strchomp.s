.align 4
.global my_strchomp
my_strchomp:
	push {r4, lr}
	mov r4, r0
	bl my_strlen
	cmp r0, #0
	movne r1, #0
	addne r0, r0, r4
	strneb r1, [r0, #-1]
	mov r0, r4
	pop {r4, lr}
	bx lr


