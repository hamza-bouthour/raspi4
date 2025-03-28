@ Hamza bouthour
@ mid-term
@ generate sequence of die tosses and count runs
.cpu cortex-a72
.fpu neon-fp-armv8

.data

.balign 4

dices: .word 0


.text
.align 2
.global main
.type main, %function


main:
    PUSH {fp, lr}
    ADD fp, sp, #4

    @ allocate 200 memory locations to store dices
    SUB sp, sp, #40
    LDR r0, =dices
    STR sp, [r0]

   
    @ generate numbers > upper bound provided by get_bound
    LDR r0, =dices
    BL roll_dice


    @ print rolls generated
    LDR r0, =dices
    LDR r0, [r0]
    MOV r1, #10
    BL printArrayValues


    @ count and print runs in sequence
    LDR r0, =dices
    MOV r1, #10
    BL run_counter
    

    @ quit program
    SUB sp, fp, #4
    POP {fp, pc}
