.global	add_three_integers

add_three_integers:
	addl	%esi, %edi            /* add y to z */
	leal	(%rdi,%rdx), %eax     /* add x and z, store in eax */
	ret                           /* the return value is in eax */
