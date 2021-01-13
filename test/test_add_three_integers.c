#include "unity.h"
#include "add_three_integers.h"

void setUp(void) { }
void tearDown(void) { }

void test_add(void) {
    TEST_ASSERT_EQUAL(8, add_three_integers(4, 3, 1));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_add);
    return UNITY_END();
}
