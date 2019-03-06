%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

setscreen ("graphics:640;480,nocursor")

var x : int := 51
var y : int := 51
const r : int := 20
var dx : int := 10
var dy : int := 0
var c : int := 1

Draw.Box (30, 30, 609, 449, red)

loop
    Draw.FillOval (x, y, r, r, c)
    delay (50)
    Draw.FillOval (x, y, r, r, colorbg)

    x += dx
    y += dy

    if x >= 589 then
	dx := 0
	dy := 10
	x := 588
	c := 4
    end if

    locatexy (0, 479)
    put "x-coordinate: ", x, "      ", "y-coordinate: " , y

    exit when y >= 429

end loop

Draw.FillOval (588, 428, r, r, 2)
locatexy (0, 479)
put "x-coordinate: 588", "      ", "y-coordinate: 428"
    
locatexy (250, 240)
put "End of Animation"

Draw.Box (30, 30, 609, 449, red)

