
.data
# The string to be processed.
test_string: .string "hello, world!"

.align 2

# A dedicated memory location to store the length.
length_result: .word 0

.text
.globl main

main:
    # 1. Test strlen
    la a0, test_string
    jal ra, strlen

    # Store the length in memory
    la t0, length_result
    sw a0, 0(t0)

    # 2. Test to_upper
    la a0, test_string
    jal ra, to_upper

    # Exit program
    li a0, 10
    ecall


# -------------------------------------------------
# Function: strlen
# Purpose: return the length of a string
# -------------------------------------------------
strlen:
    li t0, 0
    mv t1, a0

strlen_loop:
    lbu t2, 0(t1)
    beqz t2, strlen_done

    addi t0, t0, 1
    addi t1, t1, 1
    j strlen_loop

strlen_done:
    mv a0, t0
    ret


# -------------------------------------------------
# Function: to_upper
# Purpose: convert lowercase letters to uppercase
# -------------------------------------------------
to_upper:
    mv t1, a0

to_upper_loop:
    lbu t0, 0(t1)
    beqz t0, to_upper_done

    li t2, 97
    blt t0, t2, to_upper_next

    li t2, 122
    bgt t0, t2, to_upper_next

    addi t0, t0, -32
    sb t0, 0(t1)

to_upper_next:
    addi t1, t1, 1
    j to_upper_loop

to_upper_done:
    ret
