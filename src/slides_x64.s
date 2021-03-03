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
	.globl	se28_reg
	.type	se28_reg, @function
se28_reg:
.LFB7:
	.cfi_startproc
	movswq	%di, %rax
	ret
	.cfi_endproc
.LFE7:
	.size	se28_reg, .-se28_reg
	.globl	ze28_reg
	.type	ze28_reg, @function
ze28_reg:
.LFB8:
	.cfi_startproc
	movzwl	%di, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	ze28_reg, .-ze28_reg
	.globl	se48_to_mem
	.type	se48_to_mem, @function
se48_to_mem:
.LFB9:
	.cfi_startproc
	movslq	%edi, %rdi
	movq	%rdi, (%rsi)
	ret
	.cfi_endproc
.LFE9:
	.size	se48_to_mem, .-se48_to_mem
	.globl	ze48_to_mem
	.type	ze48_to_mem, @function
ze48_to_mem:
.LFB10:
	.cfi_startproc
	movl	%edi, %eax
	movq	%rax, (%rsi)
	ret
	.cfi_endproc
.LFE10:
	.size	ze48_to_mem, .-ze48_to_mem
	.globl	se48_from_mem
	.type	se48_from_mem, @function
se48_from_mem:
.LFB11:
	.cfi_startproc
	movslq	(%rdi), %rax
	ret
	.cfi_endproc
.LFE11:
	.size	se48_from_mem, .-se48_from_mem
	.globl	ze48_from_mem
	.type	ze48_from_mem, @function
ze48_from_mem:
.LFB12:
	.cfi_startproc
	movl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE12:
	.size	ze48_from_mem, .-ze48_from_mem
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
