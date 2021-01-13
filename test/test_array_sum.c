#include "unity.h"
#include "array_sum.h"

void setUp(void) { }
void tearDown(void) { }

void test_array_sum(void) {
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    TEST_ASSERT_EQUAL(10*11/2, array_sum(a, 10));

    int b[7] = {1, 2, 3, 4, 5, 6, 7};
    TEST_ASSERT_EQUAL(7*8/2, array_sum(b, 7));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_array_sum);
    return UNITY_END();
}
