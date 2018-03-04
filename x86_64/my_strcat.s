.section .text
.global my_strcat

.type my_strcat, @function
my_strcat:
	pushq %rdi
        loop:
        cmpb $0, (%rdi)
        je out
        incq %rdi
        jmp loop
        out:
        call my_strcpy
	popq %rdi
        ret

