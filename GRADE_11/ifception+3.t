put "Andy/Cindy?"
var x : string
get x

if x="andy" then
    x:="Andy"
elsif x="cindy" then
    x:="Cindy"
end if

put "shift = day/Night?"
var y : string
get y

if y="Day" then
    y:="day"
elsif y="Night" then
    y:="night"
    
if x="Andy" then
    if y="day" then
	put "$120"
    elsif y="night" then
	put "$160"
    else 
	put "I said Day or Night, kys"
    end if
elsif x="Cindy" then
    if y="day" then
	put "$140"
    elsif y="night" then
	put "$150"
    else
	put "I said Day or Night, kys"
    end if
else 
    put "I said Andy or cindy, kys"
end if
