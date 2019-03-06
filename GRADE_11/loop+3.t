put "does it move?"
var x : string
get x

loop
    exit when x="yes"|x="no"
    put"invalid input"
    get x
end loop

if x="yes" then
    put "should it?"
    get x
    loop
    exit when x="yes"|x="no"
    put"invalid input"
    get x
end loop

    if x="no" then
	put "duct tape"
    elsif x="yes" then
	put "no prob"
    else 
	put "kys"
    end if
elsif x="no" then
    put "should it?"
    get x
    loop
    exit when x="yes"|x="no"
    put"invalid input"
    get x
end loop

    if x="yes" then
	put "wd-40"
    elsif x="no" then
	put "no prob"
    else 
	put "kys"
    end if
else 
    put "kys"
end if
