setscreen ("graphics:640;480,nocursor")

var board : array 1 ..3 of array 1 .. 3 of int 

for i : 1 .. 3
    for j : 1 .. 3
	board (i)(j) := 0
    end for
end for

var x : int
var y : int
var turn : int := 1



for i : 1 .. 3
    if x < i*640/3 & x > (i-1)*640/3 then
	for j : 1 .. 3
	    if y < i*480/3 & y > (i-1)*480/3 then
		board (i)(j) := turn
	    end if
	end for
    end if
end for

