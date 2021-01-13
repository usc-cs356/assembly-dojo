#include "unity.h"
#include "add_two_integers.h"

void setUp(void) { }
void tearDown(void) { }

void test_add(void) {
    TEST_ASSERT_EQUAL(7, add_two_integers(4, 3));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_add);
    return UNITY_END();
}
