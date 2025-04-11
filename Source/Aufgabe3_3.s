/*
 * Aufgabe_3_3.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Unterprogrammaufruf  mit Parameterübergabe über dem Stack
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    

delay:
    push {r6}         // store r6 to stack
    mov r6, #4        // r6 = delay (f.e. 4)

delay_loop:
    subs r6, r6, #1           // r6--
    bne delay_loop            // loop while r6 != 0


    pop {r6}           // load r6 back from stack
  
    
    


stop:
	nop
	bal stop

.end
