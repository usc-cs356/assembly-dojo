.globl	array_max

array_max:
	movl	(%rdi), %ecx   /* save the first int at address rdi to ecx */
	movl	$1, %eax       /* eax = 1 */
	jmp	.L2                /* jump to .L2 */
.L3:
	addl	$1, %eax
.L2:
	cmpl	%esi, %eax     /* compare eax and esi */
	jge	.L6                /* if eax >= esi, we checked all elements eax=0..esi-1; jump to .L6 */
	movslq	%eax, %rdx     /* extend the index eax to 8 bytes */
	movl	(%rdi,%rdx,4), %edx  /* read the element at address rdi+rdx*4 and save it to edx */
	cmpl	%ecx, %edx           /* if edx is <= than our current maximum ecx, jump to .L3   */
	jle	.L3
	movl	%edx, %ecx           /* otherwise, save edx (new maximum) to ecx, jump to .L3    */
	jmp	.L3
.L6:
	movl	%ecx, %eax           /* save the maximum ecx to the return value register eax    */
	ret
