%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programmer  : Suraj Patel
% Teacher     : Mr. Chow
% Course      : ICS3U1
%
% Program Name: Battleship
% Description :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%%%%%%%%%% GENERAL: VARIABLES & CONSTANTS %%%%%%%%%%
% Note:





var x, y, useless1, useless2 : int
var playerturn : boolean := true
var shipsize : array 1 .. 5 of int := init (2, 3, 3, 4, 5)
var shipsize_index : int := 1
var keypressed : string (1)











%%%%%%%%%% START_UP: HEADS UP DISPLAY (HUD) %%%%%%%%%%
setscreen ("graphics:1070;530,nocursor")

Text.ColorBack (white)

cls

locatexy (460, 265)
put "PRESS \"i\" TO SEE INSTRUCTIONS,"
locatexy (455, 255)
put "OR PRESS \"s\" TO SKIP TO THE GAME"

%%%%%%%%%% START_UP: MAIN CODE %%%%%%%%%%

loop
    getch (keypressed)
    exit when Str.Lower (keypressed) = "i"| Str.Lower (keypressed) = "s"
    Input.Flush
end loop












%%%%%%%%%% INSTRUCTIONS: MAIN CODE %%%%%%%%%%

cls

if keypressed = "i" then

    locatexy (200, 265)
    put "THIS IS THE ENEMY"
    locatexy (750, 265)
    put "THIS IS YOU"

    locatexy (175, 100)
    put "press any key to continue"
    locatexy (700, 100)
    put "press any key to continue"

    Draw.ThickLine (535, 0, 535, 529, 31, 20)


    getch (keypressed)

    cls

    Draw.ThickLine (535, 0, 535, 529, 31, 20)


    locatexy (570, 350)
    put "AT THE START, PLACE YOUR SHIPS IN ORDER OF SMALLEST TO BIGGEST"
    locatexy (570, 300)
    put "CONTROLS:"
    locatexy (600, 265)
    put "-Right Arrow: Ship spawns to the right of the mouse"
    locatexy (600, 245)
    put "-Left Arrow: Ship spawns to the left of the mouse  "
    locatexy (600, 230)
    put "-Up Arrow: Ship spawns to the top of the mouse     "
    locatexy (600, 220)
    put "-Down Arrow: Ship spawns to the bottom of the mouse"

    locatexy (700, 100)
    put "press any key to continue"


    getch (keypressed)

    cls

    Draw.ThickLine (535, 0, 535, 529, 31, 20)


    locatexy (570, 350)
    put "MORE INSTRUCTIONS TO ADD LATER"

    locatexy (700, 100)
    put "press any key to continue"

    getch (keypressed)

    cls


end if















%%%%%%%%%% MAIN_GAME: VARIABLES & CONSTANTS %%%%%%%%%%

var compgrid : array 1 .. 10 of array 1 .. 10 of string
var playergrid : array 1 .. 10 of array 1 .. 10 of string
for i : 1 .. 10
    for j : 1 .. 10
	compgrid (i) (j) := "n"
	playergrid (i) (j) := "n"
    end for
end for

var comp_moves : flexible array 1 .. 0 of string
for i : 1 .. 10
    for j : 1 .. 10
	new comp_moves, upper (comp_moves) + 1
	comp_moves (upper (comp_moves)) := intstr (i) + "," + intstr (j)
    end for
end for
new comp_moves, 101
comp_moves (101) := ""


var exit_direction : boolean := false
var exit_innerloop : boolean := false
var comp_direction : int
var comp_move_index : int
var comp_move : string
var comp_x, comp_y : int

var playerwin, compwin : boolean := false

var comp_last_hit : string

var hits_left : array 1 .. 5 of int := init (2, 3, 3, 4, 5)




%%%%%%%%%% MAIN_GAME: HEADS UP DISPLAY (HUD) %%%%%%%%%%


Draw.FillBox (0, 500, 1069, 529, white)
Draw.FillBox (0, 0, 20, 529, white)
Draw.FillBox (550, 0, 570, 529, white)

for i : 1 .. 10
    locatexy (i * 50 - 10, 515)
    put chr (64 + i)
    Draw.Box ((i - 1) * 50 + 20, 500, i * 50 + 20, 529, black)
end for

for i : 1 .. 10
    if i = 10 then
	locatexy (5, 25)
    else
	locatexy (10, (11 - i) * 50 - 25)
    end if
    put i
    Draw.Box (0, (10 - i) * 50, 20, (11 - i) * 50, black)

    locatexy (i * 50 + 545, 515)
    put chr (64 + i)
    Draw.Box ((i - 1) * 50 + 570, 500, i * 50 + 570, 529, black)

    locatexy (555, (11 - i) * 50 - 25)
    put i
    Draw.Box (550, (10 - i) * 50, 570, (11 - i) * 50, black)
end for

Draw.FillBox (21, 0, 520, 499, 29)
Draw.FillBox (571, 0, 1069, 499, 29)

for i : 1 .. 9
    Draw.Line (i * 50 + 20, 0, i * 50 + 20, 499, black)
    Draw.Line (i * 50 + 570, 0, i * 50 + 570, 499, black)
    Draw.Line (0, i * 50, 1069, i * 50, black)
end for

Draw.Box (0, 0, 1069, 529, black)
Draw.ThickLine (535, 0, 535, 529, 31, 20)






%%%%%%%%%% MAIN_GAME: FUNCTIONS & PROCEDURES %%%%%%%%%%

process direction
    loop   % get the direction the ship spawns
	exit when exit_direction
	if hasch then
	    getch (keypressed)
	    Input.Flush
	end if
    end loop
end direction





proc draw (animation : string, xpos, ypos : int)
    if animation = "miss enemy" then
	Draw.FillOval ((xpos - 1) * 50 + 45, (ypos - 1) * 50 + 25, 13, 13, white)
    elsif animation = "miss player" then
	Draw.FillOval ((xpos - 1) * 50 + 595, (ypos - 1) * 50 + 25, 13, 13, white)
    elsif animation = "hit enemy" then
	Draw.FillOval ((xpos - 1) * 50 + 45, (ypos - 1) * 50 + 25, 13, 13, red)
    elsif animation = "hit player" then
	Draw.FillOval ((xpos - 1) * 50 + 595, (ypos - 1) * 50 + 25, 13, 13, red)
    elsif animation = "sunk enemy" then
	Draw.FillBox ((xpos - 1) * 50 + 21, (ypos - 1) * 50 + 1, xpos * 50 + 19, ypos * 50 - 1, 18)
	Draw.FillOval ((xpos - 1) * 50 + 45, (ypos - 1) * 50 + 25, 13, 13, red)
    elsif animation = "sunk player" then
	Draw.FillBox ((xpos - 1) * 50 + 571, (ypos - 1) * 50 + 1, xpos * 50 + 569, ypos * 50 - 1, 18)
	Draw.FillOval ((xpos - 1) * 50 + 595, (ypos - 1) * 50 + 25, 13, 13, red)
    end if

end draw




%%%%%%%%%% MAIN_GAME: MAIN CODE %%%%%%%%%%

fork direction

loop % placing ships
    loop

	Mouse.ButtonWait ("down", x, y, useless1, useless2)

	if x <= 570| y >= 500 then
	    exit
	end if

	exit when keypressed ~= KEY_LEFT_ARROW & keypressed ~= KEY_RIGHT_ARROW & keypressed ~= KEY_UP_ARROW & keypressed ~= KEY_DOWN_ARROW
	% like continue in python (if the last pressed key is not a direction, go to the top of the loop)

	for i : 1 .. 10     % maps the mouse position to a square on the grid
	    if x > 50 * (i - 1) + 570 & x <= 50 * i + 570 then
		x := i
		exit
	    end if
	end for
	for i : 1 .. 10
	    if y > 50 * (i - 1) & y <= 50 * i then
		y := i
		exit
	    end if
	end for


	for i : 1 .. shipsize (shipsize_index)
	    if keypressed = KEY_RIGHT_ARROW then
		if ~ (11 - shipsize (shipsize_index) >= x & playergrid (x + i - 1) (y) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox ((x - 1) * 50 + 570, (y - 1) * 50, (x + shipsize (shipsize_index) - 1) * 50 + 569, y * 50, black) %    ("ship", x + j - 1, y)
		    Draw.FillBox ((x - 1) * 50 + 575, (y - 1) * 50 + 5, (x + shipsize (shipsize_index) - 1) * 50 + 565, y * 50 - 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x + j - 1) (y) := "ship_" + intstr (shipsize_index) + "/" + intstr (j) + ".right"
		    end for
		end if
	    elsif keypressed = KEY_LEFT_ARROW then
		if ~ (shipsize (shipsize_index) <= x & playergrid (x - i + 1) (y) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox (x * 50 + 570, (y - 1) * 50, (x - shipsize (shipsize_index)) * 50 + 570, y * 50, black) %    ("ship", x + j - 1, y)
		    Draw.FillBox (x * 50 + 565, (y - 1) * 50 + 5, (x - shipsize (shipsize_index)) * 50 + 575, y * 50 - 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x - j + 1) (y) := "ship_" + intstr (shipsize_index) + "/" + intstr (j) + ".left"
		    end for
		end if
	    elsif keypressed = KEY_UP_ARROW then
		if ~ (11 - shipsize (shipsize_index) >= y & playergrid (x) (y + i - 1) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox ((x - 1) * 50 + 570, (y - 1) * 50, x * 50 + 569, (y + shipsize (shipsize_index) - 1) * 50, black) %    ("ship", x + j - 1, y)
		    Draw.FillBox ((x - 1) * 50 + 575, (y - 1) * 50 + 5, x * 50 + 565, (y + shipsize (shipsize_index) - 1) * 50 - 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x) (y + j - 1) := "ship_" + intstr (shipsize_index) + "/" + intstr (j) + ".up"
		    end for
		end if
	    elsif keypressed = KEY_DOWN_ARROW then
		if ~ (shipsize (shipsize_index) <= y & playergrid (x) (y - i + 1) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox ((x - 1) * 50 + 570, y * 50, x * 50 + 569, (y - shipsize (shipsize_index)) * 50, black) %    ("ship", x + j - 1, y)
		    Draw.FillBox ((x - 1) * 50 + 575, y * 50 - 5, x * 50 + 565, (y - shipsize (shipsize_index)) * 50 + 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x) (y - j + 1) := "ship_" + intstr (shipsize_index) + "/" + intstr (j) + ".down"
		    end for
		end if
	    end if
	end for
	if exit_innerloop then
	    exit_innerloop := false
	    exit
	end if

	shipsize_index += 1

	if shipsize_index > 5 then
	    exit
	end if

    end loop

    if shipsize_index > 5 then
	exit
    end if

end loop

exit_direction := true
shipsize_index := 1

loop % placing ships
    loop

	x := Rand.Int (1, 10)
	y := Rand.Int (1, 10)

	comp_direction := Rand.Int (1, 4)

	for i : 1 .. shipsize (shipsize_index)
	    if comp_direction = 1 then
		if ~ (11 - shipsize (shipsize_index) >= x & compgrid (x + i - 1) (y) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    for j : 1 .. shipsize (shipsize_index)
			compgrid (x + j - 1) (y) := "ship"
		    end for
		end if
	    elsif comp_direction = 2 then
		if ~ (shipsize (shipsize_index) <= x & compgrid (x - i + 1) (y) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    for j : 1 .. shipsize (shipsize_index)
			compgrid (x - j + 1) (y) := "ship"
		    end for
		end if
	    elsif comp_direction = 3 then
		if ~ (11 - shipsize (shipsize_index) >= y & compgrid (x) (y + i - 1) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    for j : 1 .. shipsize (shipsize_index)
			compgrid (x) (y + j - 1) := "ship"
		    end for
		end if
	    elsif comp_direction = 4 then
		if ~ (shipsize (shipsize_index) <= y & compgrid (x) (y - i + 1) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    for j : 1 .. shipsize (shipsize_index)
			compgrid (x) (y - j + 1) := "ship"
		    end for
		end if
	    end if
	end for
	exit when exit_innerloop

	shipsize_index += 1

	if shipsize_index > 5 then
	    exit
	end if

    end loop

    exit_innerloop := false

    if shipsize_index > 5 then
	exit
    end if

end loop



















loop
    loop

	Mouse.ButtonWait ("down", x, y, useless1, useless2)

	if x <= 20| x >= 520| y >= 500 then
	    exit
	end if


	for i : 1 .. 10     % maps the mouse position to a square on the grid
	    if x > 50 * (i - 1) + 20 & x <= 50 * i + 20 then
		x := i
		exit
	    end if
	end for
	for i : 1 .. 10
	    if y > 50 * (i - 1) & y <= 50 * i then
		y := i
		exit
	    end if
	end for

	exit when compgrid (x) (y) ~= "n" & compgrid (x) (y) ~= "ship"

	if compgrid (x) (y) = "ship" then
	    draw ("hit enemy", x, y)
	    compgrid (x) (y) := "hit"
	else
	    draw ("miss enemy", x, y)
	    compgrid (x) (y) := "miss"
	end if





	delay (300)







	comp_move_index := Rand.Int (1, upper (comp_moves) - 1)
	comp_move := comp_moves (comp_move_index)
	comp_x := strint (comp_move (1 .. index (comp_move, ",") - 1))
	comp_y := strint (comp_move (index (comp_move, ",") + 1 .. length (comp_move)))
	if length (playergrid (comp_x) (comp_y)) >= 4 & playergrid (comp_x) (comp_y) (1 .. 4) = "ship" then
	    draw ("hit player", comp_x, comp_y)
	    playergrid (comp_x) (comp_y) := "hit"
	    comp_last_hit := comp_move
	    hits_left (playergrid (comp_x) (comp_y) (index (playergrid (comp_x) (comp_y), "_") + 1)) -= 1
	    put hits_left (playergrid (comp_x) (comp_y) (index (playergrid (comp_x) (comp_y), "_") + 1  .. index (playergrid (comp_x) (comp_y), "_") + 2)
	else
	    draw ("miss player", comp_x, comp_y)
	    playergrid (comp_x) (comp_y) := "miss"
	end if
	for i : comp_move_index .. upper (comp_moves) - 1
	    comp_moves (i) := comp_moves (i + 1)
	end for
	new comp_moves, upper (comp_moves) - 1









	for i : 1 .. 10
	    for j : 1 .. 10
		if compgrid (i) (j) = "ship" then
		    exit_innerloop := true
		    exit
		end if
		if i = 10 & j = 10 then
		    playerwin := true
		end if
	    end for
	    exit when exit_innerloop
	end for
	exit when playerwin
	exit_innerloop := false

	for i : 1 .. 10
	    for j : 1 .. 10
		if length (playergrid (i) (j)) >= 4 & playergrid (i) (j) (1 .. 4) = "ship" then
		    exit_innerloop := true
		    exit
		end if
		if i = 10 & j = 10 then
		    compwin := true
		end if
	    end for
	    exit when exit_innerloop
	end for
	exit when compwin
	exit_innerloop := false

    end loop
    exit when compwin| playerwin
end loop

if compwin then
    Draw.FillBox (0, 0, 10, 10, red)
else
    Draw.FillBox (0, 0, 10, 10, blue)
end if


