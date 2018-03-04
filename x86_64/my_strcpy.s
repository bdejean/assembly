.section .text
.global my_strcpy

.type my_strcpy, @function
my_strcpy:
        .loop:
        movb (%rsi), %al
        movb %al, (%rdi)
        cmpb $0, (%rdi)
        je .out
        incq %rdi
        incq %rsi
        jmp .loop
        .out:
        ret
