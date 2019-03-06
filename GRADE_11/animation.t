setscreen ("graphics:640;480,nocursor")

var x : int := 25
var y : int := 25
const r : int := 25
var dx : int := 10
var dy : int := 10

loop
    Draw.FillOval (x, y, r, r, 1)
    delay (50)
    Draw.FillOval (x, y, r, r, colorbg)

    x += dx
    y += dy

    if x >= 614| x <= 25 then
	dx := -dx
    end if

    if y >= 454| y <= 25 then
	dy := -dy
    end if

end loop

