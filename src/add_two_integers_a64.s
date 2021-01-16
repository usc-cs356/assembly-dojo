.global  add_two_integers

add_two_integers:
    add     w0, w0, w1   /* w0 = w0 + w1 */
    ret                  /* return value is in w0 */
