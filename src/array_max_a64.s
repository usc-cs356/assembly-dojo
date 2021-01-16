.global	array_max

array_max:
	mov	x4, x0     /* x4 = x0 (the address of the array)    */
	ldr	w0, [x0]   /* w0 = the first integer at address x0  */
	mov	w2, 1      /* w2 = 1                                */
	b	.L2        /* jump to .L2                           */
.L3:
	add	w2, w2, 1
.L2:
	cmp	w2, w1     /* if w2 >= w1, jump to .L6 (we're done) */
	bge	.L6
	ldr	w3, [x4, w2, sxtw 2]  /* w3 = integer at address x4 + "w2 extended to 8 bytes and shifted to the left by 2 bits" */
	cmp	w3, w0     /* if ww <= w0, jump to .L2 (no update)  */
	ble	.L3
	mov	w0, w3     /* w0 = w3 (update the max), jump to .L3 */
	b	.L3
.L6:
	ret
