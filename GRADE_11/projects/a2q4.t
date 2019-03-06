%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

import Dice in "classes/Dice.cla" %import must come before setscreen!
setscreen ("graphics:640;480,nocursor")
var diceObject : pointer to Dice

var sum : int
var big : int 
var small : int 
var input : string (1)



loop

    sum := 0
    big := 0
    small := 7
    




    new diceObject
    diceObject -> setSize (50)

    diceObject -> setBackColour (black)
    diceObject -> setColour (white)
    diceObject -> setCentre (50, 240)
    diceObject -> roll
    diceObject -> draw


    locatexy (50, 275)
    put 1


    locatexy (50, 205)
    put diceObject -> getNumber

    sum += diceObject -> getNumber

    if big < diceObject -> getNumber then
	big := diceObject -> getNumber
    end if

    if small > diceObject -> getNumber then
	small := diceObject -> getNumber
    end if


    diceObject -> setBackColour (white)
    diceObject -> setColour (black)
    diceObject -> setCentre (125, 240)
    diceObject -> roll
    diceObject -> draw

    locatexy (125, 275)
    put 2

    locatexy (125, 205)
    put diceObject -> getNumber

    sum += diceObject -> getNumber

    if big < diceObject -> getNumber then
	big := diceObject -> getNumber
    end if

    if small > diceObject -> getNumber then
	small := diceObject -> getNumber
    end if



    diceObject -> setBackColour (black)
    diceObject -> setColour (white)
    diceObject -> setCentre (200, 240)
    diceObject -> roll
    diceObject -> draw

    locatexy (200, 275)
    put 3

    locatexy (200, 205)
    put diceObject -> getNumber

    sum += diceObject -> getNumber

    if big < diceObject -> getNumber then
	big := diceObject -> getNumber
    end if

    if small > diceObject -> getNumber then
	small := diceObject -> getNumber
    end if


    diceObject -> setBackColour (white)
    diceObject -> setColour (black)
    diceObject -> setCentre (275, 240)
    diceObject -> roll
    diceObject -> draw

    locatexy (275, 275)
    put 4


    locatexy (275, 205)
    put diceObject -> getNumber

    sum += diceObject -> getNumber

    if big < diceObject -> getNumber then
	big := diceObject -> getNumber
    end if

    if small > diceObject -> getNumber then
	small := diceObject -> getNumber
    end if


    diceObject -> setBackColour (black)
    diceObject -> setColour (white)
    diceObject -> setCentre (350, 240)
    diceObject -> roll
    diceObject -> draw

    locatexy (350, 275)
    put 5


    locatexy (350, 205)
    put diceObject -> getNumber

    sum += diceObject -> getNumber

    if big < diceObject -> getNumber then
	big := diceObject -> getNumber
    end if

    if small > diceObject -> getNumber then
	small := diceObject -> getNumber
    end if


    diceObject -> setBackColour (white)
    diceObject -> setColour (black)
    diceObject -> setCentre (425, 240)
    diceObject -> roll
    diceObject -> draw

    locatexy (425, 275)
    put 6


    locatexy (425, 205)
    put diceObject -> getNumber

    sum += diceObject -> getNumber

    if big < diceObject -> getNumber then
	big := diceObject -> getNumber
    end if

    if small > diceObject -> getNumber then
	small := diceObject -> getNumber
    end if






    locatexy (0, 400)
    put "Sum: ", sum : 8 : 1
    put "Average: ", sum / 6 : 4 : 1
    put "Largest: ", big : 4 : 1
    put "Smallest: ", small : 3 : 1


    getch (input)

    if input = "q"| input = "Q" then
	exit
    end if

end loop



