setscreen ("graphics:640;480,nocursor")



procedure accTab (amnt : real, year : int, rate : real)

    put "Year" : 9, "Principal" : 14, "Interest" : 13, "Accumulated" : 11

    var total : real := amnt

    for i : 1 .. year

	put i : 4, total : 14 : 2, rate * 0.01 * total : 13 : 2 ..
	total += total * rate * 0.01
	put total : 16 : 2

    end for

end accTab

procedure nxnTable (n : int)

    var x : int := 0
    var y : int := 450

    for i : 1 .. n
	for a : 1 .. n
	    Draw.Box (x, y, x + 29, y + 29, black)
	    x += 30
	end for
	x := 0
	y -= 30
    end for

end nxnTable

procedure drawTable (rows, cols : int)

    var x : int := 0
    var y : int := 450

    for i : 1 .. rows
	for a : 1 .. cols
	    Draw.Box (x, y, x + 29, y + 29, black)
	    x += 30
	end for
	x := 0
	y -= 30
    end for

end drawTable

procedure drawTableExtended (r, c, l, w : int)

    var x : int := 0
    var y : int := 479 - l

    for i : 1 .. r
	for a : 1 .. c
	    Draw.Box (x, y, x + w, y + l, black)
	    x += w
	end for
	x := 0
	y -= l
    end for

end drawTableExtended

procedure accTabWithTable (amnt : real, year : int, rate : real)

    accTab (amnt, year, rate)


    var x : int := 0
    var y : int := 479 - 16
    var w : int

    for b : 1 .. year + 1
	for a : 1 .. 4
	    if a = 1 then
		Draw.Box (x, y, x + 8 * 9, y + 16, black)
		w := 8 * 9
	    elsif a = 2 then
		Draw.Box (x, y, x + 8 * 14, y + 16, black)
		w := 8 * 14
	    elsif a = 3 then
		Draw.Box (x, y, x + 8 * 13, y + 16, black)
		w := 8 * 13
	    elsif a = 4 then
		Draw.Box (x, y, x + 8 * 11, y + 16, black)
		w := 8 * 11
	    end if
	    x += w
	end for
	x := 0
	y -= 16
    end for
end accTabWithTable

accTabWithTable (1000, 30, 5)

procedure hailstone (i : int)

    var n : real := i

    loop
	if n mod 2 = 0 then
	    n /= 2
	else
	    n *= 3
	    n += 1
	end if
	put n, " " ..
	exit when n = 1
    end loop

end hailstone

function hailstonel (i : int) : int

    var n : int := i
    var a : int := 0

    loop
	if n mod 2 = 0 then
	    n := n div 2
	else
	    n *= 3
	    n += 1
	end if
	a += 1
	exit when n = 1
    end loop

    result a

end hailstonel

function longestHailstone (x, y : int) : int

    var bign : int := 0
    var bigl : int := 0


    for i : x .. y

	if hailstonel (i) > bign then
	    bign := hailstonel (i)
	    bigl := i
	end if

    end for

    result bigl

end longestHailstone


