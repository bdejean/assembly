.section .text
.global my_puts

.type my_puts, @function
my_puts:
	pushq %rdi
        call my_strlen

	movq %rax, %rdx
        movq $1, %rax
        movq $1, %rdi
	popq %rsi
        syscall

	movq $'\n', -8(%rsp)
	movq $1, %rax
	movq $1, %rdi
	leaq -8(%rsp), %rsi
	movq $1, %rdx
	syscall

	xorq %rax, %rax
        ret

