# Makefile

# Define variables
REMAINDER_DIR := services/reminder/test
DIVISION_DIR := services/division/test
MULTIPLICATION_DIR := services/multiplication/test

# Define targets
.PHONY: test

test:
    @$(MAKE) -C $(REMAINDER_DIR) test
    @$(MAKE) -C $(DIVISION_DIR) test
    @$(MAKE) -C $(MULTIPLICATION_DIR) test
