/*
 * Aufgabe_2_2.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Multiplikation
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
      .equ multiplikator , 255
      .equ multiplikand  , 255
      
    
    mov r0, #multiplikator
    mov r1, #multiplikand

    mov r2, #0 // Ergebnis
    mov r3, #0 // Upper bit

    // if r0 != 0 , goto end
    cmp r0, #0
    beq end

loop:
    adds r2, r2, r1
    adc r3, r3, #0
    subs r0, r0, #1
    bne loop             // if zero flag not set, goto loop

end:

      
stop:
	nop
	bal stop

.end
