// C
int add(int x, int y) {
    return x + y;
}

int multadd(int x, int y) {
    return 10 + x + 8*y;
}

int bias(int x, int k) {
    int bias = (1 << k) - 1;
    int mask = x >> 31;
    return x + (mask & bias);
}

int get(int *ptr) {
    return *ptr;
}

void set(int *ptr, int value) {
    *ptr = value;
}

void array_swap(int *a, int i, int j) {
    int tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
}

long local_array() {
    int a[2] = { 1, 2 };
    return (long) a;  // bad
}
