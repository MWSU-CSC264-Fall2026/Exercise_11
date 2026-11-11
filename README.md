# exercise-11

## Overview

The point of this assignment is to get hands-on with strings, character manipulation, and null-terminators. You will fix a broken string length function and implement a new function that converts a string to uppercase in place.

This exercise focuses on traversing memory byte-by-byte, checking for the null-terminator, and performing arithmetic on ASCII values. No stack frame is required unless you choose to use `s` registers.

Complete the provided `main.s` file using the Venus simulator extension in VS Code.

## Required Work

As always, the specifics can be found in comments in the source code, but the general idea is:

You will be given a string named `test_string` and a memory variable named `length_result`.

First, you will fix the `strlen` subroutine. It is up to you to determine what the error is, but the exact issue affecting this `strlen` subroutine is discussed in the reading for this module.

Second, you will implement the `to_upper` subroutine from scratch. It should:

- receive the address of a null-terminated string in `a0`,
- iterate through each character,
- check if the character is a lowercase letter (`'a'` through `'z'`),
- if it is, convert it to uppercase by subtracting 32 (or using a bitwise operation),
- store the modified character back to the same memory location,
- stop when it reaches the null-terminator,
- return the original string address in `a0`.

There are multiple valid ways to implement `to_upper`. Any correct approach is fine.

## Hint: ASCII Math

The ASCII value of an uppercase letter is exactly 32 less than its lowercase equivalent. 

For example, `'A'` is 65 and `'a'` is 97. 

To convert a lowercase letter to uppercase, you can simply subtract 32:

```assembly
addi t0, t0, -32
```

Alternatively, you can use a bitwise XOR with 32 to flip the case bit, which works in both directions:

```assembly
xori t0, t0, 32
```

Remember to only apply this math if the character is actually a lowercase letter!

## Grading

- `length_result` contains the correct length of the string: 15 points
- `test_string` is correctly converted to uppercase (checking specific characters): 35 points
- `test_string` null-terminator is preserved: 10 points
- You will not receive credit for correct values if they were not calculated in a valid way.

# Submitting Work

When you are done working, or just want to save your progress, you need to **commit AND push** your work to your repository. This can be done in any number of ways, but as I have suggested and will continue to suggest, GitHub Desktop makes this very easy. If you need more information on exactly how to do this, I suggest watching the tutorial video posted on canvas. When you are all done, submit the link to your GitHub repo to canvas. Submitting the link is just so canvas doesn't think you skipped the assignment, it has no bearing on your actual grade.

Here is some more information about submission:

1. Committing alone is not enough to submit your work. You must also push. The push step immediately follows the commit step. Without pushing, your work has not actually been submitted. 
2. If you want to check that your work has truly been submitted, you can always go to your repository online and view your most recent changes. 
3. You can commit and push as many times as you want. There is no limit, and it does not trigger any grading. It does however enable me to see your work/changes. So if you ever need my help with a programming issue, you must commit and push first.