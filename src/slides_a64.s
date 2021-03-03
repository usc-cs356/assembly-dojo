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
	.align	2
	.global	se28_reg
	.type	se28_reg, %function
se28_reg:
.LFB7:
	.cfi_startproc
	sxth	x0, w0
	ret
	.cfi_endproc
.LFE7:
	.size	se28_reg, .-se28_reg
	.align	2
	.global	ze28_reg
	.type	ze28_reg, %function
ze28_reg:
.LFB8:
	.cfi_startproc
	and	x0, x0, 65535
	ret
	.cfi_endproc
.LFE8:
	.size	ze28_reg, .-ze28_reg
	.align	2
	.global	se48_to_mem
	.type	se48_to_mem, %function
se48_to_mem:
.LFB9:
	.cfi_startproc
	sxtw	x0, w0
	str	x0, [x1]
	ret
	.cfi_endproc
.LFE9:
	.size	se48_to_mem, .-se48_to_mem
	.align	2
	.global	ze48_to_mem
	.type	ze48_to_mem, %function
ze48_to_mem:
.LFB10:
	.cfi_startproc
	uxtw	x0, w0
	str	x0, [x1]
	ret
	.cfi_endproc
.LFE10:
	.size	ze48_to_mem, .-ze48_to_mem
	.align	2
	.global	se48_from_mem
	.type	se48_from_mem, %function
se48_from_mem:
.LFB11:
	.cfi_startproc
	ldrsw	x0, [x0]
	ret
	.cfi_endproc
.LFE11:
	.size	se48_from_mem, .-se48_from_mem
	.align	2
	.global	ze48_from_mem
	.type	ze48_from_mem, %function
ze48_from_mem:
.LFB12:
	.cfi_startproc
	ldr	w0, [x0]
	ret
	.cfi_endproc
.LFE12:
	.size	ze48_from_mem, .-ze48_from_mem
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
