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

long se28_reg(short x) {
    return x;
}

unsigned long ze28_reg(unsigned short x) {
    return x;
}

void se48_to_mem(int x, long *p) {
    *p = x;
}

void ze48_to_mem(unsigned x, unsigned long *p) {
    *p = x;
}

long se48_from_mem(int *p) {
    return *p;
}

unsigned long ze48_from_mem(unsigned *p) {
    return *p;
}
