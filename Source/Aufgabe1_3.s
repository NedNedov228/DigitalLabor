/*
 * Aufgabe_1_3.S
 *
 * SoSe 2024
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

    ldr r0, =0xfff         // Load x
    ldr r1, =1         // Load Schwelle
    cmp r0, r1         // Compare x und Schwelle
    bgt set_255        // if x > Schwelle, goto set_255
    mov r0, #0         // else set r0 = 0
    b end              // goto end
set_255:
    mov r0, #255       // if x > Schwelle, set r0 = 255
end:


    //mov r0, #0
    //mov r1, #1
    //cmp r0, r1         
    //movle r0, #0       
    //movgt r0, #255

stop:
	nop
	bal stop


.end