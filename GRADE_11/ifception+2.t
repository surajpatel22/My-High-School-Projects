put "#?"
var x : real
get x

put "#?"
var y : real
get y

put "#?"
var z : real
get z

if x>y then
    if y>z then
	put x
    elsif z>x then
	put z
    end if
elsif x>z then
    put x
elsif y>z then
    put y
else
    put z
end if
