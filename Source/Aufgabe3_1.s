/*
 * Aufgabe_3_1.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Unterprogrammaufruf
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:

.equ delay_value, 3  

delay:

    stmfd sp!, {r6}           // store r6 to stack

    ldr r6, =delay_value      // r6 = address of delay_value

delay_loop:
    subs r6, r6, #1           // r6--
    bne delay_loop            // loop while r6 != 0


    ldmfd sp!, {r6}           // load r6 back from stack
  

   
stop:
	nop
	bal stop

.end
