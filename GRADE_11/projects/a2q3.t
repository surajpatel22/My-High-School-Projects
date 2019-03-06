%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

setscreen ("graphics:640;480,nocursor")


const r : int := 20

var x, y : int

x := 320
y := 240

var input : string (1)



Draw.Box (30, 30, 609, 449, red)

Draw.FillOval (x, y, r, r, black)


loop
    getch (input)

    Draw.FillOval (x, y, r, r, colorbg)


    if input = KEY_LEFT_ARROW then
	x -= 8
    elsif input = KEY_RIGHT_ARROW then
	x += 8
    elsif input = KEY_UP_ARROW then
	y += 8
    elsif input = KEY_DOWN_ARROW then
	y -= 8
    else
	exit
    end if


    if x < 50 then
	x := 50
    elsif x > 589 then
	x := 589
    elsif y > 429 then
	y := 429
    elsif y < 50 then
	y := 50
    end if
    
    Draw.FillOval (x, y, r, r, black)
    
    Draw.Box (30, 30, 609, 449, red)

end loop

locatexy (200, 240)
put "End of Animation"
Draw.Box (30, 30, 609, 449, black)




