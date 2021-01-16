.global	add_three_integers

add_three_integers:
	add	w0, w0, w1   /* w0 = w0 + w1 */
	add	w0, w0, w2   /* w0 = w0 + w2 */
	ret              /* return value is in w0 */
