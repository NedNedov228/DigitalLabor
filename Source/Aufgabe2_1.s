/*
 * Aufgabe_2_1.S
 *
 * SoSe 2025
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : 64 Bit Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
    // ===== bitmask definitions =====

// nibble 0 (bits 0-3)
.equ bread_bm,      1 << 0    
.equ butter_bm,     1 << 1    
.equ cheese_bm,     1 << 2    

// byte 1 (bits 8-15)
.equ tequila_bm,    1 << 8    
.equ milk_bm,       1 << 9    
.equ rum_bm,        1 << 10   
.equ wine_bm,       1 << 11   
.equ vodka_bm,      1 << 12   

// nibble 2 (bits 16-19)
.equ almond_bm,     1 << 16   
.equ peanut_bm,     1 << 17   
.equ chestnuts_bm,  1 << 18   

// nibble 3 (bits 20-23)
.equ apple_bm,      1 << 20   
.equ mango_bm,      1 << 21   
.equ lemon_bm,      1 << 22   

// ===== category masks =====
.equ food_bm,       (bread_bm | butter_bm | cheese_bm)
.equ drinks_bm,     (tequila_bm | milk_bm | rum_bm | wine_bm | vodka_bm)
.equ nuts_bm,       (almond_bm | peanut_bm | chestnuts_bm)
.equ fruits_bm,     (apple_bm | mango_bm | lemon_bm)

// ===== breakfast mask =====
.equ breakfast_bm,  (food_bm | milk_bm | peanut_bm | lemon_bm)

// ===== menu preparation =====
// r0: standard breakfast
ldr r0, =breakfast_bm

// r1: breakfast + all nuts
ldr r1, =breakfast_bm
orr r1, r1, #nuts_bm          // r1 |= nuts

// r2: replace milk with wine
ldr r2, =breakfast_bm
bic r2, r2, #milk_bm          // clear milk bit
orr r2, r2, #wine_bm          // set wine bit

// r3: fruits + double milk (high half-word)
ldr r3, =fruits_bm
orr r3, r3, #milk_bm          // normal milk
orr r3, r3, #(milk_bm << 16)  // double milk in high bits

// r4: vegan (no butter, milk → wine)
ldr r4, =breakfast_bm
ldr r5, =(butter_bm | milk_bm)
bic r4, r4, r5  // remove butter and milk
orr r4, r4, #wine_bm                // add wine

stop:
	nop
	bal stop

.end
