.global	array_sum

array_sum:
	mov	x4, x0  /* move the array address to x4 */
	mov	w2, 0   /* set the index w2 to 0 */
	mov	w0, 0   /* set the total w0 to 0 */
	b	.L2     /* jump to .L2 */
.L3:
	ldr	w3, [x4, w2, sxtw 2]  /* w3 = x4["w2 extended to 64 bits and shifted to the left by 2 bits"] */
	add	w0, w0, w3            /* w0 = w0 + w3 */
	add	w2, w2, 1             /* w2 = w2 + 1  */
.L2:
	cmp	w2, w1  /* compare the index w2 with the bound w1 */
	blt	.L3     /* if w2 < w1, jump to .L2 */
	ret         /* return; the total is in w0 */
