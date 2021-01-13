/* find the max in the array at address a (n > 0)*/
int array_max(int *a, int n);

/* in C, this would be:

int array_max(int *a, int n)  {
    int max = 0;
    for (int i = 1; i < n; i++) {
        if (a[i] > max) {
            max = a[i];
        }
    }
    return max;
}
*/
