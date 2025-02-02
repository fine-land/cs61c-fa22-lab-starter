.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE
    li t1 1  # ret 
    li t0 1
Loop:
    beq t0 a0 Ret
    addi t0 t0 1

    li t2 1
    mv t3 t1
Mul:          # a0 = n  t0 = iterator t0   t1 * t0
    beq t2 t0 Loop
    add t1 t1 t3 
    addi t2 t2 1
    j Mul
Ret:
    mv a0 t1    
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
