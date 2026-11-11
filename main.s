.data
# The string to be processed.
test_string: .string "hello, world!"

# Force the next variable to align to a 4-byte boundary.
.align 2

# A dedicated memory location to store the length.
length_result: .word 0

.text
.globl main

main:
    # 1. Test strlen
    la a0, test_string
    jal ra, strlen
    
    # Store the length in memory so the autograder can check it
    la t0, length_result
    sw a0, 0(t0)

    # 2. Test to_upper
    # Note: While .string literals can be read-only in real systems, 
    # the .data section in this simulator is writable, so modifying 
    # test_string in place is perfectly safe here.
    la a0, test_string
    jal ra, to_upper

    # Exit program
    li a0, 10
    ecall


# -------------------------------------------------
# Function: strlen
# Purpose: return the length of a string
# Arguments:
#   a0 = address of the string
# Returns:
#   a0 = length
# 
# TODO: Fix the bug in this function!
# -------------------------------------------------
strlen:
    li   t0, 0             # length counter
    mv   t1, a0            # pointer to current character

strlen_loop:
    lbu  t2, 0(t1)
    
    addi t0, t0, 1         # increment length
    addi t1, t1, 1         # advance pointer
    j    strlen_loop


# -------------------------------------------------
# Function: to_upper
# Purpose: convert all lowercase letters in a string 
#          to uppercase in place. 
# Hint: "in place" means you aren't copying the string to another location,
#       you are modifying each byte where it already is. By the end, 
#       the string located at test_string should be "HELLO, WORLD!"
# Arguments:
#   a0 = address of the string
# Returns:
#   a0 = address of the modified string
#
# TODO: Implement this function from scratch!
# -------------------------------------------------
to_upper:
    # Your code here
    
    ret