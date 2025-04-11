/*
 * Aufgabe_1_2.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Addition von Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:

// A ---------
//mov r0, #1 
//mov r1, #0xffffffff    
//add r2, r0, r1

//// B ---------

mov r0, #1
mov r1, #~0 
add r2, r0, r1

// C ---------
mov r0, #0x80000000
add r1, r0, r0 

stop:
	nop
	bal stop

.end
