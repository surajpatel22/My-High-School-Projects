
;this program checks if the number in the accumulator is in 2’s 
;compliment format (i.e. the left most bit = 1). If so, it then
;converts it to a positive number and moves the positive value to 
;register B.

jmp start

;data


;code
start: nop

MVI A, 0FFH; sets the value of register A

RLC; carry flag set if leftmost bit is 1 (in 2's comp.)
JNC POS; if positive or not 2's comp, end program, otherwise continue
RRC; undoes RLC
XRI 0FFH; flip the bits
INR A; add 1 to register A
MOV B, A; moves value from register A to register B
JMP DONE

POS: NOP
RRC	;UNSHIFTS THE NUMBER IF POSITIVE
MOV B, A

DONE: NOP

hlt
