put "do you like computer science?"
var x : string


loop
    get x
    exit when x="Yes"|x="yes"|x="No"|x="no"
    put "try again"
end loop

if x = "Yes" | x= "yes" then
    put "good"
else 
    put "bad"
end if
   
