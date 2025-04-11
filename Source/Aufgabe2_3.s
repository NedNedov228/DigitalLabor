/*
 * Aufgabe_2_3.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Werte Binarisieren
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
      
numbers:
    .word 0x00000001
    .word 0x00000000
    .word 0x00000005
    .word 0x00000000
    .word 0x00000002
    .word 0x00000000
    .word 0x00000003
    .word 0x00000004 

    .equ schwelle, 3

    .text
    .global _start

_start:
    ldr r0, =numbers      // r0 points to the start of the numbers
    mov r1, #0            // stores the result
    mov r2, #7            // shift counter (starts from 7)

loop:
    ldr r3, [r0], #4      // load word from [r0], then increment r0 by 4
    cmp r3, #schwelle            // compare the value with 0
    movle r4, #0          // if less or equal, set r4 = 0
    movgt r4, #8          // if greater than threshold, set r4 = 8
    
    lsl r5, r2, #2        // r5 = r2 << 2
    lsl r4, r4, r5        // shift r4 left by r2 * 4 bits = (r2 << 2) 
    orr r1, r1, r4        // combine into result register

    subs r2, r2, #1       // decrement shift counter
    bpl loop              // if r2 >= 0, repeat

stop:
	nop
	bal stop

.end
