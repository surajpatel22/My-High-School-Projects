setscreen ("graphics:640;480,nocursor")
colorback (black)
color (white)
cls

var timespeed : int := 50


const x1 : int := 20
var y1 : int := 200
const x2 : int := 619
var y2 : int := 200

var xb : int := 320
var yb : int := 240
var dx : int := 10
var dy : int := 10

var score1 : int := 0
var score2 : int := 0

var input : array char of boolean

var spacepressed : string (1)


loop

    locatexy (300, 440)
    put score1

    locatexy (340, 440)
    put score2

    Draw.FillBox (x1 - 10, y1 - 50, x1 + 10, y1 + 50, white)
    Draw.FillBox (x2 - 10, y2 - 50, x2 + 10, y2 + 50, white)

    Draw.FillBox (xb - 5, yb - 5, xb + 5, yb + 5, white)


    delay (50)


    if dx = 0 then
	locatexy (233, 280)
	put "PRESS SPACE TO CONTINUE"
	Draw.FillBox (x1 - 10, y1 - 50, x1 + 10, y1 + 50, white)
	Draw.FillBox (x2 - 10, y2 - 50, x2 + 10, y2 + 50, white)
	Draw.FillBox (xb - 5, yb - 5, xb + 5, yb + 5, white)
	loop
	    getch (spacepressed)
	    exit when spacepressed = " "
	end loop
	cls
	dx := 10
	dy := 10
    end if

    Draw.FillBox (x1 - 10, y1 - 50, x1 + 10, y1 + 50, black)
    Draw.FillBox (x2 - 10, y2 - 50, x2 + 10, y2 + 50, black)

    Draw.FillBox (xb - 5, yb - 5, xb + 5, yb + 5, black)

    Input.KeyDown (input)


    if input ('w') then

	if y1 >= 429 then
	    y1 := 429
	else
	    y1 += 10
	end if

    elsif input ('s') then

	if y1 <= 50 then
	    y1 := 50
	else
	    y1 -= 10
	end if
    end if



    if input (KEY_UP_ARROW) then

	if y2 >= 429 then
	    y2 := 429
	else
	    y2 += 10
	end if

    elsif input (KEY_DOWN_ARROW) then

	if y2 <= 50 then
	    y2 := 50
	else
	    y2 -= 10
	end if

    end if



    xb += dx
    yb += dy


    if xb <= 25 & y1 - 50 <= yb - 5 & y1 + 50 >= yb + 5 then
	if input ('w') then
	    dy += 2
	elsif input ('s') then
	    dy -= 2
	end if
	xb := 25
	dx := -dx
    end if

    if xb >= 615 & y2 - 50 <= yb - 5 & y2 + 50 >= yb + 5 then
	if input (KEY_UP_ARROW) then
	    dy += 2
	elsif input (KEY_DOWN_ARROW) then
	    dy -= 2
	end if
	xb := 615
	dx := -dx
    end if




    if xb >= 634 then
	score1 += 1
	dx := 0
	dy := 0
	xb := 320
	yb := 240
    elsif xb <= 5 then
	score2 += 1
	dx := 0
	dy := 0
	xb := 320
	yb := 240
    end if

    if yb >= 474 then
	dy := -dy
	yb := 474
    elsif yb <= 5 then
	dy := -dy
	yb := 5
    end if

    timespeed -= 1
    if timespeed <= 0 then
	if dx > 0 then
	    dx += 1
	elsif dx < 0 then
	    dx -= 1
	end if
    timespeed := 50
    end if

    end loop
