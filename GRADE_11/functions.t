function round1dp (x : real) : real
    result round (x * 10) / 10
end round1dp

put round1dp (3.55)

var powernum : int

function power (x : int, y : int) : real

    powernum := x
    
    if y not= 1 then
	for i : 2 .. abs(y)
	    powernum *= x
	end for
    end if
    
    if y < 0 then
	result 1/powernum
    elsif y=0 then
	result 1
    else
	result powernum
    end if
    
end power

put power (2, -2)


function numroots (a : real, b : real, c : real)
    if b**2-4*a*c > 0 then
	result 2
    elsif b**2-4*a*c = 0 then
	result 0







