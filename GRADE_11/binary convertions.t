function bidec (x: int) : int


    var y : string := intstr (x)
    var dec : int := 0


    for i : 1..length(y)
    
	if y(i) = "1" then 
	    dec += 2**(length(y) - i)
	end if
	
    end for
	   
    result dec
	    
	

    
end bidec
    
var y : int
get y
put bidec(y)

    
