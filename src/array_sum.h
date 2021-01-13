/* sum all n integers in the array at address a */
int array_sum(int *a, int n);

/* in C, this would be:

int array_sum(int *a, int n)  {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }
    return sum;
}
*/
