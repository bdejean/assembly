.section .text
.global my_strlen

.type my_strlen, @function
my_strlen:
        movq $0, %rax
        .next0:
        cmpb $0, (%rdi)
        je .out0
        incq %rax
        incq %rdi
        jmp .next0
        .out0:
        ret

