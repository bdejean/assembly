.align 4
.global my_strcat
my_strcat:
	push {r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl my_strlen
	add r0, r0, r4
	mov r1, r5
	bl my_strcpy
	mov r0, r4
	pop {r4, r5, lr}
	bx lr


