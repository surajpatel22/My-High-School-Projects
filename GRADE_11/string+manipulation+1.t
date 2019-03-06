
function last3char (x : string) : string

    if length (x) < 3 then
	result x
    else
	result x (length (x) - 2 .. length (x))
    end if

end last3char


function swapFirstLast (x : string) : string

    var y : string := ""

    y += x (length (x))
    y += x (2 .. length (x) - 1)
    y += x (1)
    result y

end swapFirstLast

function isVowel (x : string(1)) : boolean 
    
    if x = "a" | x = "A" | x = "e" | x = "E" | x = "i" | x = "I" | x = "o" | x = "O" | x = "u" | x = "U" then
	result true
    else 
	result false
    end if
    
end isVowel

function strRepNum (x : string, y : string(1)) : int

    var count : int := 0 
    
    for i : 1 .. length (x) 
	if x (i) = y then 
	    count += 1
	end if
    end for
    
    result count
    
end strRepNum
	    
function removePrefix (full : string, part : string) : string

    if full (1 .. length (part)) = part then
	result full ((length (part) + 1) .. length (full))
    else 
	result full
    end if
    
end removePrefix





put 1

put last3char ("CoMpUtErS") = "ErS"
put last3char ("Chow") = "how"
put last3char ("ABC") = "ABC"
put last3char ("Hi") = "Hi"

put 2

put swapFirstLast ("ComputeR") = "RomputeC"
put swapFirstLast ("Attend") = "dttenA"
put swapFirstLast ("class") = "slasc"

put 3

put isVowel("A") = true
put isVowel("u") = true
put isVowel("W") = false % if you run Turing, this statement displays true
put isVowel("m") = false % if you run Turing, this statement displays true

put 4

put strRepNum("Apple","p") = 2
put strRepNum("Apple","e") = 1
put strRepNum("Apple","z") = 0
put strRepNum("Apple","a") = 0 % Note: "a" and "A" are different characters!

put 5

put removePrefix("computerscience","computer") = "science"
put removePrefix("international","inter") = "national"
put removePrefix("coca cola", "7-up") = "coca cola"
put removePrefix("Chow", "chow") = "Chow"
