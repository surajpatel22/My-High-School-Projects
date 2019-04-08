
;THIS PROGRAM checks if all of the bits in a binary number are the
;same in both forward and reverse direction. (eg 1011 1101 is 
;a palindrome 1011 1011 is not a palindrome). It stores the number 
;to be tested in register B. If the number is a palindrome then 
;it stores FF in register C. Otherwise store 00 in register C.

jmp start

;data


;code
start: nop
MVI B, 11111111B ;sets the value in the b register to be tested
MOV E, B ;copies the b register value to the e register

MVI C, 0FFH ;sets the default value of register c to ffh (palindrome)

MVI D, 4H ;loop counter

LOOP: NOP
DCR D ;decrement loop counter

MOV A, B ;moves the b register value to the a register
RRC ;checkes the rightmost bit while moving the rightmost bit to the left
MOV B, A ;saves the modified value to the b register
JC ONE 	;if the rightmost bit was a 1,
	;compare it to the leftmost bit with that in mind

;ZERO (if the rightmost bit was a zero...) 
MOV A, E ;move the value in the e register to register a
RLC ;checkes the leftmost bit while moving the leftmost bit to the right
MOV E, A ;moves the modified value to the e register
JNC DONE ;if the leftmost bit matchs the rightmost bit go to the end of the loop 
MVI C, 00H ;otherwise, it is not a palindrome and the c register is 0h
JMP DONE ;jump to the end of the loop

ONE: NOP ;same as zero, but as if the rightmost bit was a 1
MOV A, E
RLC
MOV E, A
JC DONE
MVI C, 00H
DONE: NOP


MVI A, 0H ;sets the a register to 0 for comparison
CMP D ;compares the loop counter to 0
JC LOOP ;if loop is not done, go the the start of the loop


hlt