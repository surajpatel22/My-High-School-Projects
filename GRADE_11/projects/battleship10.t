%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programmer  : Suraj Patel
% Teacher     : Mr. Chow
% Course      : ICS3U1
%
% Program Name: Battleship
% Description :
/*  After starting the game, you spawn your 5 ships (you use your
 arrow keys to choose the directions and you click a spot to
 place the ships) When you placed all 5 ships, you and your
 opponent (the computer/A.I) will take turns guessing where the
 opponent's ships are. Once one player guesses all the locations
 that the other player's ships occupy(each ship occupies 2-5
 locations), that player wins the game.
 */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%% GENERAL: VARIABLES & CONSTANTS %%%%%%%%%%

var x, y, buttondown, useless1, useless2 : int
var playerturn : boolean := true
var shipsize : array 1 .. 5 of int := init (2, 3, 3, 4, 5)
var shipsize_index : int := 1
var input : string (1) := "n"



%%%%%%%%%% START_UP: HEADS UP DISPLAY (HUD) %%%%%%%%%%
setscreen ("graphics:1070;530,nocursor")

Text.ColorBack (white)

cls
delay (20)
Draw.FillArc (200, 450, 55, 40, -90, 90, 20)
delay (20)
Draw.FillArc (200, 390, 60, 40, -90, 90, 20)
delay (20)
Draw.FillArc (200, 450, 45, 30, -90, 90, 29)
delay (20)
Draw.FillArc (200, 390, 50, 30, -90, 90, 29)
delay (20)
Draw.FillBox (200, 350, 210, 490, 20)
delay (20)

Draw.ThickLine (275, 355, 325, 485, 10, 20)
delay (20)
Draw.ThickLine (375, 355, 325, 485, 10, 20)
delay (20)
Draw.ThickLine (300, 420, 350, 420, 10, 20)
delay (20)
Draw.Fill (325, 430, 29, 20)
delay (20)

Draw.ThickLine (380, 485, 500, 485, 10, 20)
delay (20)
Draw.ThickLine (415, 485, 415, 355, 10, 20)
delay (20)
Draw.ThickLine (465, 485, 465, 355, 10, 20)
delay (20)

Draw.ThickLine (525, 485, 525, 355, 10, 20)
delay (20)
Draw.ThickLine (525, 355, 580, 355, 10, 20)
delay (20)

Draw.ThickLine (605, 355, 605, 485, 10, 20)
delay (20)
Draw.ThickLine (605, 355, 660, 355, 10, 20)
delay (20)
Draw.ThickLine (605, 420, 660, 420, 10, 20)
delay (20)
Draw.ThickLine (605, 485, 660, 485, 10, 20)
delay (20)

Draw.FillArc (745, 463, 60, 43, 90, 240, 20)
delay (20)
Draw.FillOval (745, 463, 50, 33, 0)
delay (20)
Draw.FillArc (695, 395, 60, 43, 270, 66, 20)
delay (20)
Draw.FillArc (695, 395, 50, 33, 269, 69, 0)
delay (20)

Draw.ThickLine (780, 355, 780, 500, 10, 20)
delay (20)
Draw.ThickLine (780, 423, 840, 423, 10, 20)
delay (20)
Draw.ThickLine (840, 355, 840, 500, 10, 20)
delay (20)


Draw.ThickLine (900, 355, 900, 500, 10, 20)
delay (20)
Draw.ThickLine (875, 500, 925, 500, 10, 20)
delay (20)
Draw.ThickLine (875, 355, 925, 355, 10, 20)
delay (20)

Draw.FillArc (950, 460, 60, 45, -90, 90, 20)
delay (20)
Draw.FillArc (950, 460, 50, 35, -90, 90, 29)
delay (20)
Draw.ThickLine (950, 355, 950, 500, 10, 20)
delay (20)


locatexy (400, 275)
put "WITH KEYBOARD:"
locatexy (470, 265)
put "PRESS \"i\" TO SEE INSTRUCTIONS,"
locatexy (470, 255)
put "OR PRESS \"s\" START THE GAME"

locatexy (250, 200)
put "WITH MOUSE:"
locatexy (400, 150)
put "START"
Draw.ThickLine (375, 125, 465, 125, 10, 20)
Draw.ThickLine (375, 180, 465, 180, 10, 20)
Draw.ThickLine (375, 125, 375, 180, 10, 20)
Draw.ThickLine (465, 125, 465, 180, 10, 20)
locatexy (575, 150)
put "INSTRUCTIONS"
Draw.ThickLine (550, 125, 685, 125, 10, 20)
Draw.ThickLine (550, 180, 685, 180, 10, 20)
Draw.ThickLine (550, 125, 550, 180, 10, 20)
Draw.ThickLine (685, 125, 685, 180, 10, 20)


%%%%%%%%%% START_UP: Functions and Procedures %%%%%%%%%%

fcn StartGame_or_Instructions : string (1)
    var choice : string (1) := "n"
    loop
	if hasch then
	    getch (choice)
	end if
	Mouse.Where (x, y, buttondown)
	if buttondown = 1 then
	    if x >= 365 & x <= 475 & y >= 115 & y <= 190 then
		choice := "s"
	    elsif x >= 540 & x <= 695 & y >= 115 & y <= 190 then
		choice := "i"
	    end if
	end if
	exit when Str.Lower (choice) = "i"| Str.Lower (choice) = "s"
    end loop
    result choice
end StartGame_or_Instructions

%%%%%%%%%% START_UP: MAIN CODE %%%%%%%%%%


input := StartGame_or_Instructions

if ~hasch then
    loop
	Mouse.Where (x, y, buttondown)
	exit when buttondown = 0
    end loop
else
    Input.Flush
end if

cls

if input = "i" then

    locatexy (200, 265)
    put "THIS IS THE ENEMY"
    locatexy (750, 265)
    put "THIS IS YOU"

    locatexy (145, 100)
    put "press any key or click to continue"
    locatexy (670, 100)
    put "press any key or click to continue"

    Draw.ThickLine (535, 0, 535, 529, 31, 20)


    loop
	if hasch then
	    Input.Flush
	    exit
	end if
	Mouse.Where (x, y, buttondown)
	if buttondown = 1 then
	    exit
	end if
    end loop

    if ~hasch then
	loop
	    Mouse.Where (x, y, buttondown)
	    exit when buttondown = 0
	end loop
    else
	Input.Flush
    end if

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

    locatexy (670, 100)
    put "press any key or click to continue"


    loop
	if hasch then
	    Input.Flush
	    exit
	end if
	Mouse.Where (x, y, buttondown)
	if buttondown = 1 then
	    exit
	end if
    end loop

    if ~hasch then
	loop
	    Mouse.Where (x, y, buttondown)
	    exit when buttondown = 0
	end loop
    else
	Input.Flush
    end if

    cls

    Draw.ThickLine (535, 0, 535, 529, 31, 20)


    locatexy (570, 360)
    put "After you place your ships, it's time to guess where the"
    locatexy (570, 340)
    put "opponent's ships are and sink them; After every turn,"
    locatexy (570, 330)
    put "a peg will spawn:"
    locatexy (600, 300)
    put "WHITE PEG: MISS"
    locatexy (600, 280)
    put "RED PEG: HIT"
    locatexy (660, 240)
    put "SINK ALL THE OPPONENT'S SHIPS TO WIN!!!"

    locatexy (670, 100)
    put "press any key or click to continue"



    loop
	if hasch then
	    Input.Flush
	    exit
	end if
	Mouse.Where (x, y, buttondown)
	if buttondown = 1 then
	    exit
	end if
    end loop

    if ~hasch then
	loop
	    Mouse.Where (x, y, buttondown)
	    exit when buttondown = 0
	end loop
    else
	Input.Flush
    end if

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

var comp_last_hits : flexible array 1 .. 0 of string

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
    loop     % get the direction the ship spawns
	exit when exit_direction
	if hasch then
	    getch (input)
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

loop         % placing ships
    loop

	Mouse.ButtonWait ("down", x, y, useless1, useless2)

	if x <= 570| y >= 500 then
	    exit
	end if

	exit when input ~= KEY_LEFT_ARROW & input ~= KEY_RIGHT_ARROW & input ~= KEY_UP_ARROW & input ~= KEY_DOWN_ARROW
	% like continue in python (if the last pressed key is not a direction, go to the top of the loop)

	for i : 1 .. 10         % maps the mouse position to a square on the grid
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
	    if input = KEY_RIGHT_ARROW then
		if ~ (11 - shipsize (shipsize_index) >= x & playergrid (x + i - 1) (y) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox ((x - 1) * 50 + 570, (y - 1) * 50, (x + shipsize (shipsize_index) - 1) * 50 + 569, y * 50, black)         %    ("ship", x + j - 1, y)
		    Draw.FillBox ((x - 1) * 50 + 575, (y - 1) * 50 + 5, (x + shipsize (shipsize_index) - 1) * 50 + 565, y * 50 - 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x + j - 1) (y) := "ship"
		    end for
		end if
	    elsif input = KEY_LEFT_ARROW then
		if ~ (shipsize (shipsize_index) <= x & playergrid (x - i + 1) (y) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox (x * 50 + 570, (y - 1) * 50, (x - shipsize (shipsize_index)) * 50 + 570, y * 50, black)         %    ("ship", x + j - 1, y)
		    Draw.FillBox (x * 50 + 565, (y - 1) * 50 + 5, (x - shipsize (shipsize_index)) * 50 + 575, y * 50 - 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x - j + 1) (y) := "ship"
		    end for
		end if
	    elsif input = KEY_UP_ARROW then
		if ~ (11 - shipsize (shipsize_index) >= y & playergrid (x) (y + i - 1) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox ((x - 1) * 50 + 570, (y - 1) * 50, x * 50 + 569, (y + shipsize (shipsize_index) - 1) * 50, black)         %    ("ship", x + j - 1, y)
		    Draw.FillBox ((x - 1) * 50 + 575, (y - 1) * 50 + 5, x * 50 + 565, (y + shipsize (shipsize_index) - 1) * 50 - 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x) (y + j - 1) := "ship"
		    end for
		end if
	    elsif input = KEY_DOWN_ARROW then
		if ~ (shipsize (shipsize_index) <= y & playergrid (x) (y - i + 1) = "n") then
		    exit_innerloop := true
		    exit
		end if
		if i = shipsize (shipsize_index) then
		    Draw.FillBox ((x - 1) * 50 + 570, y * 50, x * 50 + 569, (y - shipsize (shipsize_index)) * 50, black)         %    ("ship", x + j - 1, y)
		    Draw.FillBox ((x - 1) * 50 + 575, y * 50 - 5, x * 50 + 565, (y - shipsize (shipsize_index)) * 50 + 5, 26)
		    for j : 1 .. shipsize (shipsize_index)
			playergrid (x) (y - j + 1) := "ship"
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

loop         % placing ships
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


	for i : 1 .. 10         % maps the mouse position to a square on the grid
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
	if playergrid (comp_x) (comp_y) = "ship" then
	    draw ("hit player", comp_x, comp_y)
	    playergrid (comp_x) (comp_y) := "hit"
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
		if playergrid (i) (j) = "ship" then
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




var explosionsize : int := 1
if compwin then
    for i : 0 .. 17
	Draw.FillOval (270, 250, explosionsize, explosionsize, 42)
	explosionsize += round (2 ** (i / 2))
	delay (25)
    end for
else
    for i : 0 .. 17
	Draw.FillOval (820, 250, explosionsize, explosionsize, 42)
	explosionsize += round (2 ** (i / 2))
	delay (25)
    end for
end if

Text.ColourBack (42)
Text.Colour (104)
locatexy (500, 250)
if compwin then
    put "YOU LOSE!!!"
else
    put "YOU WIN!!!"
end if


