.global	args_sum
args_sum:
	add	w0, w0, w1
	add	w0, w0, w2
	add	w0, w0, w3
	add	w0, w0, w4
	add	w0, w0, w5
	add	w0, w0, w6
	add	w0, w0, w7
	ldr	w7, [sp]
	add	w0, w0, w7
	ldr	w1, [sp, 8]
	add	w0, w0, w1
	ret

.global	args_sum_example
args_sum_example:
	sub	sp, sp, #32
	stp	x29, x30, [sp, 16]
	add	x29, sp, 16
	mov	w0, 10
	str	w0, [sp, 8]
	mov	w0, 9
	str	w0, [sp]
	mov	w7, 8
	mov	w6, 7
	mov	w5, 6
	mov	w4, 5
	mov	w3, 4
	mov	w2, 3
	mov	w1, 2
	mov	w0, 1
	bl	args_sum
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 32
	ret
