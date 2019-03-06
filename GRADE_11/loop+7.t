put "x? (int)"
var x : int
var y : int
get x
y:=1

loop
    exit when x>0
    put "x must be >0"
    put "input new value"
    get x
end loop

loop
    exit when x<1
    y*=x
    x-=1
end loop

put y  
