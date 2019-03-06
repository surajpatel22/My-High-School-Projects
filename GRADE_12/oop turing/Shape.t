
unit
class Shape
    
    export setCentre, getCentreX, getCentreY, getWidth, getHeight, getColour, draw
    var centreX, centreY, width, height, col : int
    
    centreX := 320
    centreY := 200
    width := 40
    height := 50
    col := red
    
    proc setCentre (x, y : int)
        centreX := x
        centreY := y
    end setCentre
    
    fcn getCentreX : int
        result centreX
    end getCentreX
    
    fcn getCentreY : int
        result centreY
    end getCentreY
    
    
    fcn getWidth : int
        result width
    end getWidth
    
    fcn getHeight : int
        result height
    end getHeight
    
    fcn getColour : int
        result col
    end getColour
    
    deferred proc draw
    
    
end Shape






