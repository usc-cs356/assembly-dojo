	.arch armv8-a
	.file	"slides.c"
	.text
	.align	2
	.global	add
	.type	add, %function
add:
.LFB0:
	.cfi_startproc
	add	w0, w0, w1
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.align	2
	.global	multadd
	.type	multadd, %function
multadd:
.LFB1:
	.cfi_startproc
	add	w0, w0, 10
	add	w0, w0, w1, lsl 3
	ret
	.cfi_endproc
.LFE1:
	.size	multadd, .-multadd
	.align	2
	.global	bias
	.type	bias, %function
bias:
.LFB2:
	.cfi_startproc
	mov	w2, 1
	lsl	w2, w2, w1
	sub	w2, w2, #1
	and	w2, w2, w0, asr 31
	add	w0, w2, w0
	ret
	.cfi_endproc
.LFE2:
	.size	bias, .-bias
	.align	2
	.global	get
	.type	get, %function
get:
.LFB3:
	.cfi_startproc
	ldr	w0, [x0]
	ret
	.cfi_endproc
.LFE3:
	.size	get, .-get
	.align	2
	.global	set
	.type	set, %function
set:
.LFB4:
	.cfi_startproc
	str	w1, [x0]
	ret
	.cfi_endproc
.LFE4:
	.size	set, .-set
	.align	2
	.global	array_swap
	.type	array_swap, %function
array_swap:
.LFB5:
	.cfi_startproc
	sxtw	x1, w1
	ldr	w3, [x0, x1, lsl 2]
	sxtw	x2, w2
	ldr	w4, [x0, x2, lsl 2]
	str	w4, [x0, x1, lsl 2]
	str	w3, [x0, x2, lsl 2]
	ret
	.cfi_endproc
.LFE5:
	.size	array_swap, .-array_swap
	.align	2
	.global	local_array
	.type	local_array, %function
local_array:
.LFB6:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w0, 1
	str	w0, [sp, 8]
	mov	w0, 2
	str	w0, [sp, 12]
	add	x0, sp, 8
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	local_array, .-local_array
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
