.globl	args_sum
args_sum:
	addl	%esi, %edi
	addl	%edx, %edi
	addl	%ecx, %edi
	addl	%r8d, %edi
	leal	(%rdi,%r9), %eax
	addl	8(%rsp), %eax
	addl	16(%rsp), %eax
	addl	24(%rsp), %eax
	addl	32(%rsp), %eax
	ret

.globl	args_sum_example
args_sum_example:
	pushq	$10
	pushq	$9
	pushq	$8
	pushq	$7
	movl	$6, %r9d
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	args_sum
	addq	$32, %rsp
	ret
