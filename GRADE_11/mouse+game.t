setscreen ("graphics:640;480,nocursor")

var input : array char of boolean

var playerx : int := 100
var playery : int := 150

var dx : int := 10
var dy : int := 10
const startdy : int := 10

var mousex, mousey, mouseclick : int := 0

var clickbuffer : int := 2
var clickbufferstart : boolean := false

var aplatx : int
var aplaty : int
var aisplat : boolean := false
var bplatx : int
var bplaty : int
var bisplat : boolean := false
var cplatx : int
var cplaty : int
var cisplat : boolean := false
var dplatx : int
var dplaty : int
var displat : boolean := false


function recthit (ax1, ay1, ax2, ay2, bx1, by1, bx2, by2 : int) : boolean

    if ax1 <= bx2 & ax2 >= bx1 & ay1 >= by2 & ay2 > by1 then
	result true
    else
	result false
    end if

end recthit

var num : int := 1000

function hitdir (x, y : int) : string
    if recthit (playerx, playery, playerx + 30, playery + 75, x, y, x + 300, y + 50) then
	if abs (playerx - (x + 200)) < num then
	    num := abs (playerx - (x + 200))
	    result "right"
	end if
	if abs (playerx + 30 - x) < num then
	    num := abs (playerx + 30 - x)
	    result "left"
	end if
	if abs (playery - (y + 50)) < num then
	    num := abs (playery - (y + 50))
	    result "top"
	end if
	if abs (playery + 75 - y) < num then
	    num := abs (playery + 75 - y)
	    result "bottom"
	end if
    else
	result "false"
    end if
end hitdir



procedure hit (x, y : int)

    if hitdir (x, y) = "left" then
	loop
	    exit when recthit (playerx, playery, playerx + 30, playery + 75, x, y, x + 300, y + 50) = false
	    playerx -= 10
	end loop
    elsif hitdir (x, y) = "right" then
	loop
	    exit when recthit (playerx, playery, playerx + 30, playery + 75, x, y, x + 300, y + 50) = false
	    playerx += 10
	end loop
    elsif hitdir (x, y) = "top" then
	loop
	    exit when recthit (playerx, playery, playerx + 30, playery + 75, x, y, x + 300, y + 50) = false
	    playery += 10
	end loop
    elsif hitdir (x, y) = "bottom" then
	loop
	    exit when recthit (playerx, playery, playerx + 30, playery + 75, x, y, x + 300, y + 50) = false
	    playery -= 10
	end loop
    end if
end hit



Draw.FillBox (0, 0, 639, 479, 11)
Draw.FillBox (0, 0, 639, 49, green)
Draw.ThickLine (500, 0, 500, 639, 5, black)

loop
    if aisplat = true then
	Draw.FillBox (aplatx, aplaty, aplatx + 200, aplaty + 50, black)
    end if
    if bisplat = true then
	Draw.FillBox (bplatx, bplaty, bplatx + 200, bplaty + 50, black)
    end if
    if cisplat = true then
	Draw.FillBox (cplatx, cplaty, cplatx + 200, cplaty + 50, black)
    end if
    if displat = true then
	Draw.FillBox (dplatx, dplaty, dplatx + 200, dplaty + 50, black)
    end if


    Draw.FillBox (playerx, playery, playerx + 30, playery + 75, red)


    Draw.ThickLine (500, 0, 500, 639, 5, black)

    delay (67)

    if aisplat = true then
	Draw.FillBox (aplatx, aplaty, aplatx + 200, aplaty + 50, 11)
    end if
    if bisplat = true then
	Draw.FillBox (bplatx, bplaty, bplatx + 200, bplaty + 50, 11)
    end if
    if cisplat = true then
	Draw.FillBox (cplatx, cplaty, cplatx + 200, cplaty + 50, 11)
    end if
    if displat = true then
	Draw.FillBox (dplatx, dplaty, dplatx + 200, dplaty + 50, 11)
    end if

    Draw.FillBox (playerx, playery, playerx + 30, playery + 75, 11)


    Mouse.Where (mousex, mousey, mouseclick)


    Input.KeyDown (input)

    if input ('a') then
	playerx -= dx
    elsif input ('d') then
	playerx += dx
    end if

    if input ('w') then
	dy := -startdy
    else
	dy := startdy
    end if



    playery -= dy

    if playery <= 50 then
	playery := 50
    end if

    if playery >= 405 then
	playery := 405
    end if

    if playerx <= 0 then
	playerx := 0
    end if

    if playerx >= 469 then
	playerx := 469
    end if


    if aisplat then
	aplatx -= dx
    end if
    if bisplat then
	bplatx -= dx
    end if
    if cisplat then
	cplatx -= dx
    end if
    if displat then
	dplatx -= dx
    end if

    if aisplat then
	if aplatx <= -200 then
	    aisplat := false
	end if
    end if
    if bisplat then
	if bplatx <= -200 then
	    bisplat := false
	end if
    end if
    if cisplat then
	if cplatx <= -200 then
	    cisplat := false
	end if
    end if
    if displat then
	if dplatx <= -200 then
	    displat := false
	end if
    end if





    if mouseclick = 1 & mousex > 500 & clickbuffer <= 0 then
	clickbufferstart := true
	clickbuffer := 2
	if aisplat = false then
	    aisplat := true
	    aplatx := mousex
	    aplaty := mousey
	elsif bisplat = false then
	    bisplat := true
	    bplatx := mousex
	    bplaty := mousey
	elsif cisplat = false then
	    cisplat := true
	    cplatx := mousex
	    cplaty := mousey
	elsif displat = false then
	    displat := true
	    dplatx := mousex
	    dplaty := mousey
	end if
    end if

    if mouseclick = 1 then
	clickbufferstart := true
    end if

    if clickbufferstart then
	clickbuffer -= 1
    end if

    if aisplat then
	hit (aplatx, aplaty)
    end if
    if bisplat then
	hit (bplatx, bplaty)
    end if
    if cisplat then
	hit (cplatx, cplaty)
    end if
    if displat then
	hit (dplatx, dplaty)
    end if


end loop
