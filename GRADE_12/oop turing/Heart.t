
unit
class Heart
    inherit Shape in "Shape.t"
    
    col := red
    
    body proc draw
        var x : array 1 .. 3 of int  
        x(1) := centreX - width div 2
        x(2) := centreX + width div 2
        x(3) := centreX
        var y : array 1 .. 3 of int 
        y(1) := centreY + height div 8
        y(2) := centreY + height div 8
        y(3) := centreY - height div 2
        Draw.FillPolygon(x, y, 3, col)
        Draw.FillArc(centreX - width div 4, centreY + height div 8, width div 4, height * 3 div 8, 0, 180, col)
        Draw.FillArc(centreX + width div 4, centreY + height div 8, width div 4, height * 3 div 8, 0, 180, col)
    end draw

end Heart
