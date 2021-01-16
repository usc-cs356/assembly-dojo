.global	array_sum

array_sum:
	movl	$0, %eax   /* set index eax to 0 */
	movl	$0, %edx   /* set total edx to 0 */
	jmp	.L2            /* jump to the comparison */
.L3:
	movslq	%eax, %rcx           /* extend the index eax to 8 bytes in rcx */
	addl	(%rdi,%rcx,4), %edx  /* add the 4 bytes at rdi+rcx*4 to the total edx */
	addl	$1, %eax             /* increase the index by 1 */
.L2:
	cmpl	%esi, %eax   /* compare eax and esi */
	jl	.L3              /* if eax < esi, jump to .L3 */
	movl	%edx, %eax   /* otherwise, move the total to eax */
	ret                  /* the return value is the total in eax */
