@ Hamza bouthour
@ mid-term
@ generate sequence of die tosses and count runs
.cpu cortex-a72
.fpu neon-fp-armv8

.data
log: .asciz "test"
.balign 4

dices: .word 0


.text
.align 2
.global main
.type main, %function


main:
    PUSH {fp, lr}
    ADD fp, sp, #4

    ldr r0, =log
    bl printf
    

    @ quit program
    SUB sp, fp, #4
    POP {fp, pc}
