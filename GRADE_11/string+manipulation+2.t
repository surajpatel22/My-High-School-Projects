
function lower_upper (x : string, y : string) : string

    result Str.Upper (x) + Str.Lower (y)

end lower_upper

function magicWord (x : string) : boolean

    if Str.Lower(x) = "please" then
	result true
    else
	result false
    end if
    
end magicWord

function trimSpaces (x : string) : string

    var ans : string := ""
    for i: 1 .. length (x)
	if x(i) ~= " " then
	    ans += x(i)
	end if
    end for
    result ans
      
end trimSpaces

function isSubstring (x, sub : string) : boolean

    var ch : int := 1

    for i : 1..length (x)
	if ch ~= length (sub) + 1 then
	    if sub (ch) = x (i) then
		ch += 1
	    elsif ch ~= length (sub) then
		ch := 1
	    end if
	end if
    end for
    if ch = length (sub) + 1 then
	result true
    else result false
    end if

end isSubstring


put 5

put lower_upper("cho","oww") = "CHOoww"
put lower_upper("cOmP","uTeR") = "COMPuter"
put lower_upper("coca", "COLA") = "COCAcola"
put lower_upper("nEVEr", "sKIP") = "NEVERskip"

put 6

put magicWord("please") = true
put magicWord("Please") = true
put magicWord("pLeAsE") = true
put magicWord("PLEAse") = true
put magicWord("Mr. Chow") = false

put 7

put trimSpaces("Ciao Chow") = "CiaoChow"
put trimSpaces(" spaces! ") = "spaces!"
put trimSpaces(" a e i o u ") = "aeiou"
put trimSpaces(" ") = ""

put 8

put isSubstring("chow", "ho") = true
put isSubstring("forte", "for") = true
put isSubstring("toronto", "tom") = false
put isSubstring("markville", "maark") = false

