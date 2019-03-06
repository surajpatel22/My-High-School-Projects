unit
class Block
    export setX, getX, setY, getY, setHeight, getHeight, setWidth, getWidth, draw, move
    
    var picID : int %all platforms & the player are drawn with a picture (ground is never drawn, so it does not need it)
    var x, y, h, w : int := 100 %all blocks require these variables (just set to 100 as default)
    
    proc setX (xVal : int) %getter/setter methods
        x := xVal
    end setX
    
    fcn getX : int
        result x
    end getX
    
    proc setY (yVal : int)
        y := yVal
    end setY
    
    fcn getY : int
        result y
    end getY
    
    proc setHeight (height : int)
        h := height
    end setHeight
    
    fcn getHeight : int
        result h
    end getHeight
    
    proc setWidth (width : int)
        w := width
    end setWidth
    
    fcn getWidth : int
        result w
    end getWidth
    
    proc draw   %all platforms and the player are drawn with a picture
        Pic.Draw(picID, x, y, picCopy)
    end draw
    
    deferred proc move  %movement is different for the player and the platforms, but they both still move
    
end Block
