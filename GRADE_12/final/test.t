setscreen("graphics:700;600,nocursor")

var titlescreen : int := Pic.Scale(Pic.FileNew("instructions.jpg"), maxx, maxy)

Pic.Draw(titlescreen, 0, 0, picCopy)
var mouseX, mouseY, click : int

loop
    mousewhere(mouseX, mouseY, click)
    locatexy(0, 600)
    put mouseX, " ", mouseY
end loop
