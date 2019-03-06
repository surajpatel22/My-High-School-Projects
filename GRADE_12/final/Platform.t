unit
class Platform
    inherit Block in "Block.t"
    
    export setPic, hitPlayer    %there are 3 different platform options with their own 
                                %picture and its easier to test collision with player
                                %1 block at a time
    
    proc setPic(click : int)    %choosing what type of platform this is (flat, tall, or square)
        if click = 1 then %left click = flat
            picID := Pic.Scale(Pic.FileNew("movingplatform.jpg"), 200, 50)
            h := 50
            w := 200
        elsif click = 10 then %middle click = square
            picID := Pic.Scale(Pic.FileNew("marioblock.jpg"), 80, 80)   
            h := 80
            w := 80
        elsif click = 100 then %rightclick = tall
            picID := Pic.Scale(Pic.FileNew("pipe.jpg"), 50, 125)   
            h := 125
            w := 50
        end if
    end setPic
            
    
    body proc move  %moves towards the left
        x -= 7
    end move
    
    fcn hitPlayer (playX1, playY1, playX2, playY2 : int) : boolean  %checks for collision with the player
        if x > playX2 | x + w < playX1 | y > playY2 | y + h < playY1 then
            result false
        end if
        result true
    end hitPlayer
    
end Platform
