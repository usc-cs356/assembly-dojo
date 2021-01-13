#include "unity.h"
#include "array_max.h"

void setUp(void) { }
void tearDown(void) { }

void test_array_max(void) {
    int a[10] = {1, 2, 3, 42, 5, 6, 7, 8, 9, 10};
    TEST_ASSERT_EQUAL(42, array_max(a, 10));

    int b[7] = {22, 11, 3, 4, 58, 6, 71};
    TEST_ASSERT_EQUAL(71, array_max(b, 7));

    int c[7] = {122, 11, 3, 4, 58, 6, 71};
    TEST_ASSERT_EQUAL(122, array_max(c, 7));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_array_max);
    return UNITY_END();
}
