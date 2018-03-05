.section .text
.global main
main:

subq $8, %rsp

movq %rsp, %rdi
callq time

movq %rsp, %rdi
callq ctime

movq %rax, %rdi
movq stdout, %rsi
call fputs

addq $8, %rsp
	
movq $60, %rax
movq $0, %rdi
syscall

