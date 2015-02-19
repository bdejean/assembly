.section .text
.global my_chomp

.type my_chomp, @function
my_chomp:
	movq %rdi, %r15
	callq my_strlen
	cmpq $0, %rax
	je .L_out
	leaq -1(%r15, %rax), %rax
	cmpb $'\n', (%rax)
	jne .L_out
	movb $0, (%rax)
	.L_out:
	ret

