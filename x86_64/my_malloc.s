.section .data
current_break: .long 0

.section .text
.global my_malloc

.type my_malloc, @function
my_malloc:
	cmpq $0, current_break
	je .first_call
	.do_alloc:
	movq %rdi, -8(%rsp)
	movq $12, %rax
	addq current_break, %rdi
	syscall
	movq %rax, current_break
	movq -8(%rsp), %rdi
	subq %rdi, %rax
	ret
	.first_call:
	movq %rdi, -8(%rsp)
	movq $12, %rax
	movq $0, %rdi
	syscall
	movq %rax, current_break
	movq -8(%rsp), %rdi
	jmp .do_alloc
	
	

