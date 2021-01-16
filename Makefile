CC_A64 := aarch64-linux-gnu-gcc -static
CFLAGS += -Wall -Wextra -std=c17 -MMD -MP -Og -g -Isrc
TEST := $(wildcard test/test_*.c)

# each test/test_function.c can have src/function_x64.s or src/function_a64.s (or both)
TEST_X64 := $(patsubst test/test_%.c,bin/test_%_x64,$(TEST))
TEST_X64 := $(filter $(TEST_X64), $(patsubst src/%.s,bin/test_%,$(wildcard src/*_x64.s)))
TEST_X64_RES := $(patsubst bin/%,test/%.res,$(TEST_X64))

TEST_A64 := $(patsubst test/test_%.c,bin/test_%_a64,$(TEST))
TEST_A64 := $(filter $(TEST_A64), $(patsubst src/%.s,bin/test_%,$(wildcard src/*_a64.s)))
TEST_A64_RES := $(patsubst bin/%,test/%.res,$(TEST_A64))

OBJ := $(patsubst bin/test_%,build/%.o,$(TEST_X64)) $(patsubst bin/test_%,build/%.o,$(TEST_A64)) \
	$(patsubst bin/%,build/%.o,$(TEST_X64)) $(patsubst bin/%,build/%.o,$(TEST_A64))

.DEFAULT_GOAL := all
.PHONY: clean all test

clean:
	rm -rf bin/* build/* test/*.res

# list all to keep intermediate results
all: $(TEST_X64) $(TEST_A64) $(OBJ)

# how to compile quiz .o files
build/%_x64.o: src/%_x64.s
	$(CC) $(CFLAGS) -c $^ -o $@

build/%_a64.o: src/%_a64.s
	$(CC_A64) $(CFLAGS) -c $^ -o $@

# compile the testing framework (later linked with test binaries)
build/unity_x64.o: test/unity.c
	$(CC) $(CFLAGS) -c $^ -o $@

build/unity_a64.o: test/unity.c
	$(CC_A64) $(CFLAGS) -c $^ -o $@

# how to compile the test .o files
build/test_%_x64.o: test/test_%.c
	$(CC) $(CFLAGS) -c $^ -o $@

build/test_%_a64.o: test/test_%.c
	$(CC_A64) $(CFLAGS) -c $^ -o $@

# how to link the test binaries
bin/test_%_x64: build/test_%_x64.o build/%_x64.o build/unity_x64.o
	$(CC) $(CFLAGS) $^ -o $@

bin/test_%_a64: build/test_%_a64.o build/%_a64.o build/unity_a64.o
	$(CC_A64) $(CFLAGS) $^ -o $@

# how to generate test results
test/test_%_x64.res: bin/test_%_x64
	-./$< > $@ 2>&1

test/test_%_a64.res: bin/test_%_a64
	-./$< > $@ 2>&1

# run the tests
test: all $(TEST_X64_RES) $(TEST_A64_RES)
	@echo "\n=== TESTS\n"
	@echo ">>> PASSED"
	@echo "`grep -s :PASS test/*.res | sed 's/:/\t/'`\n"
	@echo ">>> FAILED"
	@echo "`grep -s :FAIL test/*.res | sed 's/:/\t/'`\n"

# extra: generate solutions from C file
src/%_x64.s: src/%.c
	$(CC) -Wall -Wextra -std=c17 -Og -S $< -o $@

src/%_a64.s: src/%.c
	$(CC_A64) -Wall -Wextra -std=c17 -Og -S $< -o $@

# use dependency info from gcc
-include $(patsubst src/%.s,build/%.d,$(wildcard src/*.s))
-include $(patsubst test/%.c,build/%.d,$(wildcard test/*.c))
