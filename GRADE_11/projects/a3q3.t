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
	    x +=50
	    
	end for
	x := 320 - 50 * 4
	y -= 50
    end for

end eightByEightTable

eightByEightTable


