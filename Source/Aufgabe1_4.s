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
    mov r2, #25

      // r0:r1 + r2:r3 → r4:r5, overflow in r6
    
    // Add lower 32 bits (r1 + r3)
    adds r4, r1, r3   // r4 = r1 + r3, sets carry flag (C0) if overflow

    // Save C0 in r7 (temp)
    mov  r7, #0       // r7 = 0 
    adc  r7, r7, #0   // r7 = 0 + 0 + C0 → r7 = C0

    // Add upper 32 bits (r0 + r2)
    adds r5, r0, r2   // r5 = r0 + r2, sets carry flag (C1) if overflow

    // Save C1 in r8 (temp)
    mov  r8, #0       // r8 = 0 
    adc  r8, r8, #0   // r8 = 0 + 0 + C1 → r8 = C1

    // Add lower carry (C0) to upper result (r5) ===
    adds r5, r5, r7   // r5 += C0, sets carry flag (C2) if overflow

    // Save C2 in r9 (temp)
    mov  r9, #0       // r9 = 0 
    adc  r9, r9, #0   // r9 = 0 + 0 + C2 → r9 = C2

    // Final overflow 
    orr  r6, r8, r9   // r6 = C1 | C2 

stop:
	nop
	bal stop

.end
