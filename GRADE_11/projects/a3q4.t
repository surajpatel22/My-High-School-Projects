%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

setscreen ("graphics:640;480, nocursor")

procedure eightByEightTable

    var x : int := 320 - 50 * 4
    var y : int := 240 + 50 * 4

    for i : 1 .. 8
	for a : 1 .. 8

	    Draw.Box (x, y, x + 50, y - 50, black)
	    x += 50

	end for
	x := 320 - 50 * 4
	y -= 50
    end for

end eightByEightTable


function eightByEightTarget : int

    var x : int := Rand.Int (0, 7)
    var y : int := Rand.Int (0, 7)

    Draw.FillOval (145 + x * 50, 415 - y * 50, 20, 20, red)

    result (y+1)*10+x+1
    
end eightByEightTarget


eightByEightTable % This generates an 8x8 table
put eightByEightTarget % A target should appear randomly

% On the top left corner, you should see the
% position of the ball based on the row and col

