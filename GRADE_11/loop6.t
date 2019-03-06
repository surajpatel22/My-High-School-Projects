var x : real
var y : real
var z : real

put "start value?"
get x

put "increment value?"
get y
if y<0 then
    loop
	put "increment can't be negative"
	put "new increment?"
	get y
	exit when y>0
    end loop
end if

put "end value?"
get z

if x>z then
    loop
	put "start value has to be less than end value"
	put "new end value?"
	get z
	exit when z>x
    end loop
end if

loop
    exit when x>z
    put x
    x+=y
end loop
