CC_ARM := aarch64-linux-gnu-gcc -static
CFLAGS += -Wall -Wextra -std=c17 -MMD -MP -Og -g -Isrc
TEST := $(wildcard test/test_*.c)

# each test/test_function.c can have src/function_x86.s or src/function_arm.s (or both)
TEST_X86 := $(patsubst test/test_%.c,bin/test_%_x86,$(TEST))
TEST_X86 := $(filter $(TEST_X86), $(patsubst src/%.s,bin/test_%,$(wildcard src/*_x86.s)))
TEST_X86_RES := $(patsubst bin/%,test/%.res,$(TEST_X86))

TEST_ARM := $(patsubst test/test_%.c,bin/test_%_arm,$(TEST))
TEST_ARM := $(filter $(TEST_ARM), $(patsubst src/%.s,bin/test_%,$(wildcard src/*_arm.s)))
TEST_ARM_RES := $(patsubst bin/%,test/%.res,$(TEST_ARM))

OBJ := $(patsubst bin/test_%,build/%.o,$(TEST_X86)) $(patsubst bin/test_%,build/%.o,$(TEST_ARM)) \
	$(patsubst bin/%,build/%.o,$(TEST_X86)) $(patsubst bin/%,build/%.o,$(TEST_ARM))

.DEFAULT_GOAL := all
.PHONY: clean all test

clean:
	rm -rf bin/* build/* test/*.res

# list all to keep intermediate results
all: $(TEST_X86) $(TEST_ARM) $(OBJ)

# how to compile quiz .o files
build/%_x86.o: src/%_x86.s
	$(CC) $(CFLAGS) -c $^ -o $@

build/%_arm.o: src/%_arm.s
	$(CC_ARM) $(CFLAGS) -c $^ -o $@

# compile the testing framework (later linked with test binaries)
build/unity_x86.o: test/unity.c
	$(CC) $(CFLAGS) -c $^ -o $@

build/unity_arm.o: test/unity.c
	$(CC_ARM) $(CFLAGS) -c $^ -o $@

# how to compile the test .o files
build/test_%_x86.o: test/test_%.c
	$(CC) $(CFLAGS) -c $^ -o $@

build/test_%_arm.o: test/test_%.c
	$(CC_ARM) $(CFLAGS) -c $^ -o $@

# how to link the test binaries
bin/test_%_x86: build/test_%_x86.o build/%_x86.o build/unity_x86.o
	$(CC) $(CFLAGS) $^ -o $@

bin/test_%_arm: build/test_%_arm.o build/%_arm.o build/unity_arm.o
	$(CC_ARM) $(CFLAGS) $^ -o $@

# how to generate test results
test/test_%_x86.res: bin/test_%_x86
	-./$< > $@ 2>&1

test/test_%_arm.res: bin/test_%_arm
	-./$< > $@ 2>&1

# run the tests
test: all $(TEST_X86_RES) $(TEST_ARM_RES)
	@echo "\n=== TESTS\n"
	@echo ">>> PASSED"
	@echo "`grep -s :PASS test/*.res | sed 's/:/\t/'`\n"
	@echo ">>> FAILED"
	@echo "`grep -s :FAIL test/*.res | sed 's/:/\t/'`\n"

# extra: generate solutions from C file
src/%_x86.s: src/%.c
	$(CC) -Wall -Wextra -std=c17 -Og -S $< -o $@

src/%_arm.s: src/%.c
	$(CC_ARM) -Wall -Wextra -std=c17 -Og -S $< -o $@

# use dependency info from gcc
-include $(patsubst src/%.s,build/%.d,$(wildcard src/*.s))
-include $(patsubst test/%.c,build/%.d,$(wildcard test/*.c))
