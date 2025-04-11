/*
 * Aufgabe_1_4.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Maskenoperationen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    
    mov r0, #22
    mov r1, #0
    mov r2, #25
    mov r3, #0

      // r0:r1 + r2:r3 → r4:r5, overflow in r6
    
    // Add lower 32 bits (r1 + r3)
    adds r4, r1, r3   // r4 = r1 + r3, sets carry flag (C0) if overflow


    // Add upper 32 bits (r0 + r2)
    adcs r5, r0, r2   // r5 = r0 + r2, sets carry flag (C1) if overflow

    // Save C1 in r8 (temp)
    movcc r6, #0
    movcs r6, #1
    
stop:
	nop
	bal stop

.end
