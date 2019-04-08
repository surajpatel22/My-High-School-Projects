
;the program checks if the lowest (rightmost) 7 bits of a number,
;stored in register B, has an odd number of 1’s. If so, it then 
;makes the highest order (leftmost) bit a 0; Otherwise, it makes
;it a 1. It then stores the result in register C.

jmp start

;data


;code
start: nop

MVI B, 01011101B ;sets the value that is stored in B

MVI D, 7H ;the counter for the loop 
MVI E, 0H ;counter for the # of 1s

MOV H, B ;copies the number to be checked in register H

LOOP: NOP
MOV A, H ;moves the number to be checked in register A
DCR D ;decrements the loop counter
RRC ;checks the rightmost bit and moves it to the left
JNC ZERO ;if the rightmost bit was a 0, it doesn't increment the 1 counter
INR E ;otherwise, if it was a 1, increment the 1 counter
ZERO: NOP
MOV H, A ;saves bitshifted value in register h
MVI A, 0H ;sets register A to 0 for a comparison
CMP D ;checks to see if the loop has ended
JC LOOP ;if the loop has not ended, go to the start of the loop

MOV A, E ;MOVES THE 1 COUNTER TO REGISTER A TO BE CHECKED
RRC; CHECKES THE RIGHTMOST BIT OF THE 1 COUNTER VALUE
JNC EVEN ;IF THE 1 COUNTER WAS EVEN, JUMP TO EVEN
MOV A, B ;OTHERWISE MOVE THE ORIGINAL VALUE TO REGISTER A,
ANI 7FH ;AND MAKE THE LEFTMOST BIT 0
JMP DONE ;SKIP THE EVEN STUFF
EVEN: NOP
MOV A, B ;MOVE THE ORIGINAL VALUE TO THE A REGISTER
ORI 80H ;MAKES THE LEFTMOST BIT A 1
DONE: NOP
MOV C, A ;MOVES THE VALUE IN THE A REGISTER TO THE C REGISTER

hlt
