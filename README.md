# Assembly Dojo (x86-64 and arm64)

## How to create new practice examples

- Write a header file with the prototype of your function, for example
  `src/add_two_integers.h` containing:

  ```
  int add_two_integers(int x, int y);
  ```

- Write an assembly implementation for this function in
  `src/add_two_integers_x86.s` or `src/add_two_integers_arm.s` (or both),
  for example:

  ```
  .globl  add_two_integers

  add_two_integers:
      movl %edi,%eax
      addl %esi,%eax
      ret
  ```

- Write a test for your implementation in `test/test_add_two_integers.c:

  ```
  #include "unity.h"
  #include "add_two_integers.h"

  void setUp(void)    { }
  void tearDown(void) { }

  void test_add(void) {
    TEST_ASSERT_EQUAL(7, add_two_integers(4, 3));
  }

  int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_add);
    return UNITY_END();
  }
  ```

- Compile the implementation and the test:

  ```
  make bin/test_add_two_integers_x86
  make bin/test_add_two_integers_arm
  ```

- Run it:

  ```
  ./bin/test_add_two_integers_x86
  ./bin/test_add_two_integers_arm
  ```

## Compile all examples, run all tests

You can also compile and run all tests with `make test`. Test results
are saved in `.res` files inside `test` (e.g.,
`test/test_add_two_integers.res`).

## Manually compile a C file for ARM64

```
# compile as arm64
aarch64-linux-gnu-gcc -static -Og -g hello.c -o hello

# check the generated assembly
aarch64-linux-gnu-objdump -d hello

# runs arm64 binary on x86-86 Linux!
./hello

# debug it
qemu-aarch64 -g 1234 ./bin/main
gdb-multiarch ./bin/main -ex 'target remote :1234'
```

For help, reach out to: [paolieri@usc.edu](mailto:paolieri@usc.edu)

To contribute, create a pull request.
