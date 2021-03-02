	.file	"slides.c"
	.text
	.globl	add
	.type	add, @function
add:
.LFB0:
	.cfi_startproc
	leal	(%rdi,%rsi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.globl	multadd
	.type	multadd, @function
multadd:
.LFB1:
	.cfi_startproc
	leal	10(%rdi,%rsi,8), %eax
	ret
	.cfi_endproc
.LFE1:
	.size	multadd, .-multadd
	.globl	bias
	.type	bias, @function
bias:
.LFB2:
	.cfi_startproc
	movl	$1, %eax
	movl	%esi, %ecx
	sall	%cl, %eax
	subl	$1, %eax
	movl	%edi, %edx
	sarl	$31, %edx
	andl	%edx, %eax
	addl	%edi, %eax
	ret
	.cfi_endproc
.LFE2:
	.size	bias, .-bias
	.globl	get
	.type	get, @function
get:
.LFB3:
	.cfi_startproc
	movl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE3:
	.size	get, .-get
	.globl	set
	.type	set, @function
set:
.LFB4:
	.cfi_startproc
	movl	%esi, (%rdi)
	ret
	.cfi_endproc
.LFE4:
	.size	set, .-set
	.globl	array_swap
	.type	array_swap, @function
array_swap:
.LFB5:
	.cfi_startproc
	movslq	%esi, %rsi
	leaq	(%rdi,%rsi,4), %rcx
	movl	(%rcx), %esi
	movslq	%edx, %rdx
	leaq	(%rdi,%rdx,4), %rax
	movl	(%rax), %edx
	movl	%edx, (%rcx)
	movl	%esi, (%rax)
	ret
	.cfi_endproc
.LFE5:
	.size	array_swap, .-array_swap
	.globl	local_array
	.type	local_array, @function
local_array:
.LFB6:
	.cfi_startproc
	movl	$1, -8(%rsp)
	movl	$2, -4(%rsp)
	leaq	-8(%rsp), %rax
	ret
	.cfi_endproc
.LFE6:
	.size	local_array, .-local_array
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
