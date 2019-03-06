unit
class Player
    inherit Block in "Block.t"
    
    export setDx, getDx, setDy, getDy, resetJumpcount

    var input : array char of boolean

    var dx, dy : int := 0 %deltax/y (displacement per frame [velocity])
    var acceleration : int := -1
    var jumpcount : int := 2 %limits jumps at a time to 2 (a double jump)
    var canJump : boolean := true %is false for 0.5s after jumping to stop 2nd jump at same time as first
    
    var picRight : int := Pic.FileNew("walk-mario.jpg") %default animation
    picID := picRight %setting drawn animation to walking right as default
    
    h := Pic.Height(picID) %making a standard height and width based on the first animation to prevent collision problems
    w := Pic.Width(picID)
                                                %all animation pictures are saved under different 
                                                %variables instead of just 1 because it creates a new instance
                                                %every time you would do Pic.FileNew(), which causes memory problems
    var picLeft : int := Pic.Mirror(Pic.FileNew("walk-mario.jpg"))
    var picJumpRight : int := Pic.Scale(Pic.FileNew("mariojump.jpg"), w, h)
    var picJumpLeft : int := Pic.Mirror(picJumpRight)
    var picStanding : int := Pic.Scale(Pic.FileNew("mariostanding.jpg"), w, h)

    
    x := 500 div 2  %a nice spot to start
    y := maxy div 2
    
    process justJumped %sets canJump to false for 0.5s after jumping to stop 2nd jump happening at the same time as the first
        canJump := false
        delay(500)
        canJump := true
    end justJumped

    proc setDx (deltaX : int) %getter/setter methods
        dx := deltaX
    end setDx
    
    fcn getDx : int
        result dx
    end getDx
    
    proc setDy (deltaY : int)
        dy := deltaY
    end setDy
    
    fcn getDy : int
        result dy
    end getDy
    
    proc resetJumpcount %allows you to jump again after landing
        jumpcount := 2
    end resetJumpcount
    
    body proc move %base movement before collisions
    
        dy += acceleration %increases/decreases the vertical speed
        dx := 0 %resets horizontal movement if not clicking left or right keys
        Input.KeyDown (input) %gets input from keyboard
        if input('a') | input(KEY_LEFT_ARROW) then
            dx := -10           %move left
            picID := picLeft
        end if
        if input('d') | input(KEY_RIGHT_ARROW) then
            dx := 10            %move right
            picID := picRight
        end if
        if jumpcount > 0 & canJump & (input('w') | input(KEY_UP_ARROW)) then
            dy := 18            %if havent exceded 2 jumps and did not just jump 50ms ago and right keys were pressed, jump
            jumpcount -= 1 %limits you to 2 jumps
            fork justJumped %prevents double jump right after (50ms) the first jump
        end if
        
        if dy - acceleration ~= 0 then %if player is moving up or down, set jumping animation (dy - acceleration because acceleration is recently factored in)
            picID := picJumpRight 
            if dx < 0 then      %left or right jumping animation
                picID := picJumpLeft
            end if
        elsif ~( input('a') | input('d') | input('w') | input(KEY_LEFT_ARROW) | input(KEY_RIGHT_ARROW) | input(KEY_UP_ARROW) ) then
            picID := picStanding    %if no input and not jumping, set standing animation
        end if
        
        y += dy %increment x & y values
        x += dx
        
    end move
    
end Player
    
    