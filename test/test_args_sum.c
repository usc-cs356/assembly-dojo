#include "unity.h"
#include "args_sum.h"

void setUp(void) { }
void tearDown(void) { }

void test_args_sum(void) {
    TEST_ASSERT_EQUAL(55, args_sum_example());
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_args_sum);
    return UNITY_END();
}
