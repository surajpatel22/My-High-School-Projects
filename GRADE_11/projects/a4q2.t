function chrMC (c : string(1)) : string
    
    case Str.Upper(c) of
	label " " : result ""
	label "A" : result ".-"
	label "B" : result "-..."
	label "C" : result "-.-."
	label "D" : result "-.."
	label "E" : result "."
	label "F" : result "..-."
	label "G" : result "--."
	label "H" : result "...."
	label "I" : result ".."
	label "J" : result ".---"
	label "K" : result "-.-"
	label "L" : result ".-.."
	label "M" : result "--"
	label "N" : result "-."
	label "O" : result "---"
	label "P" : result ".--."
	label "Q" : result "--.-"
	label "R" : result ".-."
	label "S" : result "..."
	label "T" : result "-"
	label "U" : result "..-"
	label "V" : result "...-"
	label "W" : result ".--"
	label "X" : result "-..-"
	label "Y" : result "-.--"
	label "Z" : result "--.."
	label "0" : result "-----"
	label "1" : result ".----"
	label "2" : result "..---"
	label "3" : result "...--"
	label "4" : result "....-"
	label "5" : result "....."
	label "6" : result "-...."
	label "7" : result "--..."
	label "8" : result "---.."
	label "9" : result "----."
    end case
    
end chrMC

function strMC (s : string) : string

    var x : string := ""

    for i : 1 .. length (s) 
	x += chrMC(s(i)) + " "
    end for

    result x ( 1 .. length (x) - 1)

end strMC
    
put chrMC("9") = "----."
put chrMC("9") = "----."
put chrMC("h") = "...."
put chrMC("H") = "...."

put strMC("A b C d E f") = ".-  -...  -.-.  -..  .  ..-."
put strMC("Hello World") = ".... . .-.. .-.. ---  .-- --- .-. .-.. -.."
put strMC("HELLO WORLD") = ".... . .-.. .-.. ---  .-- --- .-. .-.. -.."
put strMC("COMPUTER123") = "-.-. --- -- .--. ..- - . .-. .---- ..--- ...--"
