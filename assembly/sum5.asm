
;program calculates the sum of 5 consecutive numbers stored 
;in Memory at location 0x3000. It then stores the sum in 
;register pair D and E.

jmp start

;data


;code
start: nop

MVI A, 0H ;initializes accumulator to 0h
MVI D, 0H ;initializes sum (DE) to 0h
MVI E, 0H 
LXI H, 3000H ;sets memory location to 3000h


MVI B, 5H ;loop counter

LOOP: NOP
DCR B ;decrement loop counter
MOV A, E ;moves the first 8 bits of the sum to the accumulator
ADD M ;add the value in the memory address to the accumulator (the 
      ;first 8 bits of the sum)
JNC BIT8 ;if there was no carry (sum is 8 bit), skip next line
INR D ;add 1 (the carry) to register d (the last 8 bits of the sum)
      ;if there was a carry. 
BIT8: NOP
MOV E, A ;saves the first 8 bits of the sum in register e
INX H ;go to next memory location
MVI A, 0H ;reset the accumulator to 0h for comparison
CMP B ;compare the loop counter with 0h
JC LOOP ;if the loop is not done, go to the top of the loop

hlt