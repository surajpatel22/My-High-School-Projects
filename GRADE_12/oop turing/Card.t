
unit
class Card
    
    import  Spade in "Spade.t",
        Heart in "Heart.t",
        Club in "Club.t",
        Diamond in "Diamond.t"
    
    export getSuit, getValue, getFace, setCard, setCentre, setFace, draw, erase
    
    var font : int := Font.New("mono:12:bold")
    
    
    var spade : ^Spade
    var heart : ^Heart
    var club : ^Club
    var diamond : ^Diamond
    
    new spade
    new heart
    new club
    new diamond
    
    var cardX : int := 320
    var cardY : int := 200
    var cardHeight : int := 200
    var cardSuit : int := 1
    var cardValue : int := 1
    var cardFace : boolean := false
    var picID : int := Pic.FileNew ("cardback.jpg")
    
    proc setCard (suit, num : int)
        cardSuit := suit
        cardValue := num
    end setCard
    
    proc setCentre (x, y : int)
        cardX := x
        cardY := y
        ^spade.setCentre(cardX, cardY)
        ^heart.setCentre(cardX, cardY)
        ^club.setCentre(cardX, cardY)
        ^diamond.setCentre(cardX, cardY)
    end setCentre
    
    fcn getSuit : int
        result cardSuit
    end getSuit
    
    fcn getValue : int
        result cardValue
    end getValue
    
    proc setFace (face : boolean)
        cardFace := face
    end setFace
    
    fcn getFace : boolean
        result cardFace
    end getFace
    
    
    proc draw
        Draw.FillBox(cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2), cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2), white)
        if cardFace then
            Draw.Box(cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2), cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2), black)
            if cardSuit = 1 then
                ^spade.draw
            elsif cardSuit = 2 then
                ^heart.draw
            elsif cardSuit = 3 then
                ^club.draw
            else
                ^diamond.draw
            end if
            if cardSuit = 1 or cardSuit = 3 then
                case cardValue of
                label 1 : Draw.Text("A", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, black)
                label 2,3,4,5,6,7,8,9,10 : Draw.Text(intstr(cardValue), cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, black)
                label 11 : Draw.Text("J", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, black)
                label 12 : Draw.Text("Q", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, black)
                label 13 : Draw.Text("K", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, black)
                end case
            else
                case cardValue of
                label 1 : Draw.Text("A", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, red)
                label 2,3,4,5,6,7,8,9,10 : Draw.Text(intstr(cardValue), cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, red)
                label 11 : Draw.Text("J", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, red)
                label 12 : Draw.Text("Q", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, red)
                label 13 : Draw.Text("K", cardX - (cardHeight * 0.7 div 2) + 3, cardY + (cardHeight div 2) - 16, font, red)
                end case
            end if
        else
            Pic.Draw(picID, cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2), picCopy)
        end if
    end draw
    
    proc erase
        Draw.FillBox(cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2), cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2), white)    
    end erase
    
end Card
