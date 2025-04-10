/*
 * Aufgabe_1_2.S
 *
 * SoSe 2024
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
mov r0, #1 
ldr r1, =4294967295    
add r2, r0, r1

//// B ---------
//ldr r0, =-12
//ldr r1, =-12
//ldr r2, =-12
//ldr r3, =-12
//ldr r4, =-12

//// C ---------
//ldr r0, =0x80000000
//add r1, r0, r0 

stop:
	nop
	bal stop

.end
