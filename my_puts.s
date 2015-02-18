.section .text
.global my_puts

.type my_puts, @function
my_puts:
        movq %rdi, %r15
        call my_strlen
        movq %rax, %rdx
        movq %r15, %rsi
        movq $1, %rdi
        movq $1, %rax
        syscall
        xorq %rax, %rax
        ret

