/*
 * Aufgabe_1_3.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Flags und bedingte Ausführung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */


.global main /* Specify global symbol */
main:

    ldr r0, =0xfff     // r0 = x
    cmp r0, r1         // Compare x und Schwelle
    bgt set_255        // if x > Schwelle, goto set_255
    mov r0, #0         // else set r0 = 0
    b end              // goto end
set_255:
    mov r0, #255       // if x > Schwelle, set r0 = 255
end:


    mov r0, #1      // r0 = x
    mov r1, #2      // r1 = Schwelle
    cmp r0, r1      // Compare x und Schwelle     
    movle r0, #0    // r0 = 0 if x<=Schwelle    
    movgt r0, #255  // else r0 = 255

    mov r0, #2      // r0 = x
    mov r1, #2      // r1 = Schwelle
    cmp r0, r1      // Compare x und Schwelle     
    movle r0, #0    // r0 = 0 if x<=Schwelle    
    movgt r0, #255  // else r0 = 255

    mov r0, #3      // r0 = x
    mov r1, #2      // r1 = Schwelle
    cmp r0, r1      // Compare x und Schwelle     
    movle r0, #0    // r0 = 0 if x<=Schwelle    
    movgt r0, #255  // else r0 = 255

    mov r0, #0      // r0 = x
    mov r1, #2      // r1 = Schwelle
    cmp r0, r1      // Compare x und Schwelle     
    movle r0, #0    // r0 = 0 if x<=Schwelle    
    movgt r0, #255  // else r0 = 255
    
    ldr r0, =0xfff   // r0 = x
    mov r1, #2      // r1 = Schwelle
    cmp r0, r1      // Compare x und Schwelle     
    movle r0, #0    // r0 = 0 if x<=Schwelle    
    movgt r0, #255  // else r0 = 255



stop:
	nop
	bal stop


.end