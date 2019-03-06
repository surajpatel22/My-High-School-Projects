put "positive integer"
var x : int
get x

loop
    exit when x>=0
    put "input positive ineger"
    get x
end loop

for i : 0 .. x
    put repeat ("*",i)
end for

    
