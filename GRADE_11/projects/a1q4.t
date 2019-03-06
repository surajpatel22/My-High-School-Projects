%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var x : int
var y : int

put "Enter a positive integer:"
get x

loop
    exit when x>0
    put "Enter a positive integer:"
    get x
end loop

for i : 2 .. x
    y:=i
    exit when x mod i = 0
end for

if x=1 then 
    put "1 is neither a prime number nor composite number."
elsif y=x then
    put x, " is a prime number."
else
    put x, " is a composite number."
end if
