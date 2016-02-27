.section .rodata
.align 16
a: .float 0, 1, 2, 3
b: .float 4, 5, 6, 7

byebye_text: .ascii "See you soon"
byebye_textz: .asciz "See you soon!"
byebye_len: .int 13

.section .data
.align 16
buffer: .asciz "Hello"

.section .text

byebye:
	movq $1, %rax
	movq $1, %rdi
	movq $byebye_text, %rsi
	movq byebye_len, %rdx
	syscall
	movq $60, %rax
	movq $0, %rdi
	syscall

.type byebyez, @function
byebyez:
	movq $byebye_textz, %rdi
	call my_strlen
	movq %rax, %rdx
	movq $byebye_textz, %rsi
	movq $1, %rdi
	movq $1, %rax
	syscall
	movq $60, %rax
	movq $0, %rdi
	syscall

.type byebyez2, @function
byebyez2:
	movq $byebye_textz, %rdi
	call my_puts
	movq $60, %rax
	movq $0, %rdi
	syscall

.global _start
_start:
movaps a, %xmm0
movaps b, %xmm1
addps %xmm0, %xmm1
cmpeqps %xmm0, %xmm1

# allocate a buffer and save it to r15
subq $128, %rsp
movq %rsp, %r15

# fill it
movq %r15, %rdi
movq $byebye_textz, %rsi
call my_strcpy 

# replace the last '\n' with a space
movq %r15, %rdi
callq my_chomp

# append some text again
movq %r15, %rdi
movq $byebye_textz, %rsi
call my_strcat

# print it
movq %r15, %rdi
call my_puts 

addq $128, %rsp

movq $0x1000, %rdi
call my_malloc
movq %rax, %r14
movq %r14, %rdi
movq %r15, %rsi
callq my_strcpy

movq %r14, %rdi
call my_puts

call byebyez2


