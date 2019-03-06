%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programmer  : Suraj Patel
% Teacher     : Mr. Chow
% Course      : ICS4U1
%
% Program Name: Super Mario Arcade Collection (Versus Mode)
% Description :
/*  Player 1 is on the left of the barrier and can move left, rigth, and double jump.
    Player 2 (the mouse) spawns various platforms that continuously move to the left of the screen (left click = flat, middle click = square, right click = tall)
    Player 2 is trying to push player 1 off the screen, while player 1 is trying to stay on the screen.
    Player 1 wins if he stays on the screen for 1 minute
    Player 2 wins if Player 1 gets pushed off the screen
 */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

import  Platform in "Platform.t",
        Player in "Player.t"

setscreen("graphics:700;600,nocursor")
View.Set("offscreenonly")   %only updates screen when I say in my code
buttonchoose("multibutton") %can accept left, middle, and right click inputs from the mouse

var ground : ^Platform 
var player : ^Player
var platforms : flexible array 1 .. 0 of ^Platform % the platforms are kept track of in a flexible array
var canLand : flexible array 1 .. 0 of boolean  %for collision (says if the player is able to land on each platform or not)
var hitDetected : boolean := false  %allows you to go through the collisions again if adjustments were made
var background : int := Pic.Scale(Pic.FileNew ("background-mario.jpg"), maxx, maxy) %background during the game
var timer : real := 1000*60 %game timer (value in milliseconds)
var mouseX, mouseY, click : int %mouse x, y values and which button was clicked
var canClick : boolean := true %there is a 1 second delay between placement of platforms both to 
                               %prevent multiple platforms at once and to make it more fair for player 1

new player  %initialize the player and ground object
new ground

^ground.setX(0) %set values for gruond
^ground.setY(0)
^ground.setWidth(maxx)
^ground.setHeight(85)

process justClicked     %there is a 1 second delay between placement of platforms both to 
    canClick := false   %prevent multiple platforms at once and to make it more fair for player 1
    delay(1000)
    canClick := true
end justClicked

proc addPlatform    %add a new platform to the flexible array, initializes it, sets values for it, and draws it
    new platforms, upper(platforms) + 1
    new canLand, upper(platforms)
    
    new platforms(upper(platforms))
    ^(platforms(upper(platforms))).setX(mouseX)
    ^(platforms(upper(platforms))).setY(mouseY)
    ^(platforms(upper(platforms))).setPic(click)
    ^(platforms(upper(platforms))).draw
end addPlatform

proc removePlatform %removes a platform from the array and erases it, removing all references to it, when offscreen (the first one to be sent will be the first one to disappear)
    var tempPlatforms : flexible array 1 .. upper(platforms) - 1 of ^Platform
    
    for i : 1 .. upper(platforms) - 1
        tempPlatforms(i) := platforms(i+1)
    end for
        
    new platforms, upper(platforms) - 1
    new canLand, upper(platforms)
    
    for i : 1 .. upper(platforms)
        platforms(i) := tempPlatforms(i)
    end for
end removePlatform


Pic.Draw(Pic.Scale(Pic.FileNew("titlescreen.jpg"), maxx, maxy), 0, 0, picCopy)  %draws the titlescreen

View.Update %refreshes the window (the titlescreen is now up)

loop
    Mouse.Where(mouseX, mouseY, click)  %gets values for the mouse
    if click = 1 & mouseX > 270 & mouseX < 450 & mouseY > 310 & mouseY < 360 then   %start if you clich start
        exit
    elsif click = 1 & mouseX > 200 & mouseX < 520 & mouseY > 240 & mouseY < 280 then    %go to the instructions page if you click instrictions
        Pic.Draw(Pic.Scale(Pic.FileNew("instructions.jpg"), maxx, maxy), 0, 0, picCopy)%draw the instructions page
        View.Update %refreshes the window(outputs the instructions page)
        loop
            Mouse.Where(mouseX, mouseY, click)  %start if you click start
            exit when click = 1 & mouseX > 270 & mouseX < 440 & mouseY < 60
        end loop
        exit
    end if
end loop
        

loop %main game
    mousewhere(mouseX, mouseY, click) %gets values for the mouse
        
    if click > 0 & mouseX > 500 & mouseY > ^ground.getHeight & canClick & upper(platforms) < 3 then
        fork justClicked    %if clicked in right spot, adds the corrisponding platform and sets up a 1 second delay to prevent multiple platforms at once and to make it 
        addPlatform         %more fair for player 1
    end if
    
    Pic.Draw(background, 0, 0, picCopy) %redraw the background (basically erasing everything else)
    
    if upper(platforms) > 0 then    %if a platform exists, move them, remove them if they go off the screen, and draw them if they were not removed
        for i : 1 .. upper(platforms)
            ^(platforms(i)).move
        end for
            
        if ^(platforms(1)).getX + ^(platforms(1)).getWidth < 0 then
            removePlatform
        end if
        
        for i : 1 .. upper(platforms)
            ^(platforms(i)).draw
        end for
    end if
    
    for i : 1 .. upper(platforms)   %helps with collision (if player is above platform, the player can land on it)
        canLand(i) := ^player.getY > ^(platforms(i)).getY + ^(platforms(i)).getHeight
    end for
        
    ^player.move    %base movements for the player
    
    if ^ground.hitPlayer(^player.getX, ^player.getY, ^player.getX + ^player.getWidth, ^player.getY + ^player.getHeight) then
        ^player.setY(^ground.getHeight + 1) %collision handling for the ground (if collision, move above ground, set vertical velociy to 0, and reset your jumping ability
        ^player.setDy(0)
        ^player.resetJumpcount
    end if
    
    if ^player.getX + ^player.getWidth >= 500 then  %collision handling with the border between player 1's side and player 2's side
        ^player.setX(494 - ^player.getWidth)
    end if
    loop    %collision test with the moving platforms
        hitDetected := false %resets hitDetected variable (allows you to check again if adjustments were made)
        for i : 1 .. upper(platforms)   %go through each platform
            if ^(platforms(i)).hitPlayer(^player.getX, ^player.getY, ^player.getX + ^player.getWidth, ^player.getY + ^player.getHeight) then
                hitDetected := true %if the player is colliding with the platform, set hit detected to true (check collisions again after adjustments) and make the 
                if canLand(i) then  %corrisponding adjustments
                    ^player.setDy(0)
                    ^player.setY(^(platforms(i)).getY + ^(platforms(i)).getHeight + 1)
                    ^player.resetJumpcount
                else
                    if ^player.getDx < 0 & ^player.getX > ^(platforms(i)).getX + ^(platforms(i)).getWidth + ^player.getDx + 7 then %%%%
                        ^player.setX(^(platforms(i)).getX + ^(platforms(i)).getWidth + 1)
                    elsif ^player.getDx + 7 > 0 & ^player.getX + ^player.getWidth < ^(platforms(i)).getX + ^player.getDx + 7 then
                        ^player.setX(^(platforms(i)).getX - ^player.getWidth - 1)
                    else
                        ^player.setY(^(platforms(i)).getY - ^player.getHeight - 1)
                        ^player.setDy(0)
                    end if
                end if
            end if
        end for
            exit when ~hitDetected  %if it goes through all platforms with no collision, exit
    end loop
    
    
    ^player.draw    %draw everything else that needs to be drawn
    Draw.ThickLine(500, 0, 500, maxy, 10, black)
    Font.Draw("Timer: " + realstr(timer / 1000, 4) + "s", 10, 560, Font.New("comicsans:20:bold"), red)
    
    exit when ^player.getX + ^player.getWidth < 0  | timer < 0 %game ends if player 1 goes off the screen or the timer runs out

    View.Update %refresh the window
    delay(50)   %50ms per frame
    timer -= 50 %50ms less time left
    
end loop

if timer < 0 then   %if timer ran out, player 1 wins, otherwise player 2 wins
    Pic.Draw(Pic.Scale(Pic.FileNew("p1victory.jpg"), maxx, maxy), 0, 0, picCopy)
else
    Pic.Draw(Pic.Scale(Pic.FileNew("p2victory.jpg"), maxx, maxy), 0, 0, picCopy)
end if

View.Update %refresh the window to show the victory screens






