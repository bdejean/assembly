.section .text
.global my_chomp

.type my_chomp, @function
my_chomp:
	pushq %r15
	movq %rdi, %r15
	callq my_strlen
	# cmpq $0, %rax
	# testq is 1-byte shorter
	testq %rax, %rax
	je .L_out
	leaq -1(%r15, %rax), %rax
	cmpb $'\n', (%rax)
	jne .L_out
	movb $0, (%rax)
	.L_out:
	popq %r15
	ret

