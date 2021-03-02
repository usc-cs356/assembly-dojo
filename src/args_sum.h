/* passing 10 arguments */
int args_sum(int x1, int x2, int x3, int x4, int x5,
             int x6, int x7, int x8, int x9, int x10);


/* in C, this would be:
int args_sum(int x1, int x2, int x3, int x4, int x5,
             int x6, int x7, int x8, int x9, int x10) {
    return x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10;
}
*/

int args_sum_example();

/* in C, this would be:
int args_sum_example() {
    return args_sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
}
*/
