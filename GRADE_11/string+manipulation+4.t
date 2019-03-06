var text1 : int

open : text1, "fly_me_to_the_moon.txt", put

put : text1, "Fly me to the moon"
put : text1, "Let me play among the stars"
put : text1, "Let me see what spring is like"
put : text1, "On Jupiter and Mars"
put : text1, ""
put : text1, "In other words: hold my hand"
put : text1, "In other words: baby, kiss me"
put : text1, ""
put : text1, "Fill my heart with song"
put : text1, "And let me sing for ever more"
put : text1, "You are all I long for"
put : text1, "All I worship and adore"
put : text1, ""
put : text1, "In other words: please, be true"
put : text1, "In other words: I love you"

close : text1

var x : string

open : text1, "fly_me_to_the_moon.txt", get

loop
    exit when eof (text1)
    get : text1, x :*
    put x
end loop

close : text1



