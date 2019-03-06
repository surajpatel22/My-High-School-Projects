
unit
class Dice

    inherit Shape in "Shape.t"
    
    export diceValue, setSize, setColour, getValue, setValue
    
    var diceValue : int := 1
    
    height := width
    col := black
    
    proc setSize (n : int)
        height := n
        width := n
    end setSize
    
    proc setColour (n : int)
        if n < 0 | n > 255 then
            col := black
        else
            col := n
        end if
    end setColour
    
    fcn getValue : int
        result diceValue
    end getValue
    
    proc setValue (n : int)
        if n < 0 | n > 6 then
            diceValue := 1
        else
            diceValue := n
        end if
    end setValue
    
    body proc draw
        Draw.Box(centreX - width div 2, centreY - height div 2, centreX + width div 2, centreY + height div 2, black)
        
        if diceValue mod 2 = 1 then
            Draw.FillOval(centreX, centreY, height div 9, height div 9, col)
        end if
        if diceValue ~= 1 then
            Draw.FillOval(centreX - height div 3, centreY + height div 3 , height div 9, height div 9, col)
            Draw.FillOval(centreX + height div 3, centreY - height div 3 , height div 9, height div 9, col)
        end if
        if diceValue > 3 then
            Draw.FillOval(centreX + height div 3, centreY + height div 3 , height div 9, height div 9, col)
            Draw.FillOval(centreX - height div 3, centreY - height div 3 , height div 9, height div 9, col)            
        end if
        if diceValue = 6 then
            Draw.FillOval(centreX - height div 3, centreY, height div 9, height div 9, col)
            Draw.FillOval(centreX + height div 3, centreY, height div 9, height div 9, col)
        end if
    end draw

end Dice

