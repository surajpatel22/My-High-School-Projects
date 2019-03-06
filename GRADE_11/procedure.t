setscreen ("graphics:640;480,nocursor")









procedure greet (name : string)
    put "Hi ", name, ", how are you doing?"
end greet

procedure draw2Circles (centreX, centreY, radius, space, col1, col2 : int)

    Draw.FillOval (centreX, centreY, radius, radius, col1)
    Draw.FillOval (centreX + space, centreY, radius, radius, col2)

end draw2Circles



procedure happyFace (centreX, centreY, radius, col : int)

    Draw.Oval (centreX, centreY, radius, radius, col)
    Draw.Arc (centreX, centreY, round (radius * 3 / 4), round (radius * 3 / 4), 180, 0, col)
    Draw.Oval (round (centreX - radius / 3), round (centreY + radius / 3), round (radius / 6), round (radius / 6), col)
    Draw.Oval (round (centreX + radius / 3), round (centreY + radius / 3), round (radius / 6), round (radius / 6), col)

end happyFace



procedure slidingHappyFace (centreX, centreY, radius, col, steps : int, dir : string (1))
    var x, y : int
    x := centreX
    y := centreY

    for i : 0 .. steps
	happyFace (x, y, radius, col)
	delay (50)
	Draw.FillOval (x, y, radius, radius, colorbg)

	if dir = "a" then
	    x -= 10
	elsif dir = "d" then
	    x += 10
	elsif dir = "w" then
	    y += 10
	elsif dir = "s" then
	    y -= 10
	end if
    end for

end slidingHappyFace




draw2Circles (20, 20, 5, 10, 2, 4)

%%% Test Cases %%%
greet ("Mr.Chow")     % Hi Mr.Chow, how are you doing? Should be displayed
greet ("Jimmy")     % Hi Jimmy, how are you doing? Should be displayed



slidingHappyFace (320, 240, 50, 1, 10, "w")
