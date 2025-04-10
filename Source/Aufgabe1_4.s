/*
 * Aufgabe_1_4.S
 *
 * SoSe 2024
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
    
    mov r1, #22
    mov r2, #25

      // --- 64-bit Addition (R0:R1 + R2:R3 → R4:R5, overflow in R6) ---
    
    // Step 1: Add lower 32 bits (R1 + R3)
    ADDS R4, R1, R3   // R4 = R1 + R3, sets carry flag (C0) if overflow
    
    // Save carry from lower addition (C0) in R7 (temporary)
    MOV  R7, #0       // Initialize R7 = 0
    ADC  R7, R7, #0   // R7 = 0 + 0 + C0 → R7 = C0
    
    // Step 2: Add upper 32 bits (R0 + R2)
    ADDS R5, R0, R2   // R5 = R0 + R2, sets carry flag (C1) if overflow
    
    // Save carry from upper addition (C1) in R8 (temporary)
    MOV  R8, #0       // Initialize R8 = 0
    ADC  R8, R8, #0   // R8 = 0 + 0 + C1 → R8 = C1
    
    // Step 3: Add lower carry (C0) to upper result (R5)
    ADDS R5, R5, R7   // R5 += C0, sets carry flag (C2) if overflow
    
    // Save carry from this addition (C2) in R9 (temporary)
    MOV  R9, #0       // Initialize R9 = 0
    ADC  R9, R9, #0   // R9 = 0 + 0 + C2 → R9 = C2
    
    // Step 4: Compute final overflow (C1 OR C2 → R6)
    ORR  R6, R8, R9   // R6 = C1 | C2 (1 if either carry occurred)

stop:
	nop
	bal stop

.end
