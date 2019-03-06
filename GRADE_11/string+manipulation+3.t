function isSubstring (x, sub : string) : boolean

    if index (x, sub) = 0 then
	result false
    else
	result true
    end if

end isSubstring

function numOccurence (x, sub : string) : int

    var count : int := 0
    var indexstart : int := 1

    loop 
	if index (x (indexstart .. length(x)) , sub) = 0 then
	    exit 
	else
	    count += 1
	    indexstart := index (x (indexstart .. length(x)) , sub) + indexstart
	end if
    end loop

    result count    
    
end numOccurence

function stringIndex (x, sub : string) : int

    for i : 1 .. length (x) - length (sub) + 1
	if sub = x (i .. i + length(sub) - 1) then
	    result i
	end if
    end for
    result 0
    
end stringIndex

put 10

put isSubstring ("chow", "ho") = true
put isSubstring ("forte", "for") = true
put isSubstring ("toronto", "tom") = false
put isSubstring ("markville", "maark") = false

put 11

put numOccurence("chow", "ho") = 1
put numOccurence("apple", "p") = 2
put numOccurence("pingpong", "ng") = 2
put numOccurence("hakunamatata", "meh") = 0

put 12

put stringIndex("yes", "") = 1
put stringIndex("MrChow", "Cho") = 3
put stringIndex("willing", "ill") = 2
put stringIndex("hakunamatata", "meh") = 0
