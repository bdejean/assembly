.section .text
.global my_chomp

.type my_chomp, @function
my_chomp:
	pushq %rdi
	callq my_strlen
	popq %rdi
	# cmpq $0, %rax
	# testq is 1-byte shorter
	testq %rax, %rax
	je .L_out
	leaq -1(%rdi, %rax), %rax
	cmpb $'\n', (%rax)
	jne .L_out
	movb $0, (%rax)
	.L_out:
	ret

