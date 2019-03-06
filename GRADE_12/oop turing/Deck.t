
unit
class Deck
    import Card in "Card.t"
    export getDeckSize, discardCard, drawCard, getCard, shuffleDeck
    
    var deck : flexible array 1 .. 52 of ^Card
    
    
    for i : 1 .. 4
        for j : 1 .. 13
            
            new deck ((i-1)*13+j)
            ^(deck((i-1)*13+j)).setCard(i, j)
            
        end for
    end for
        
    
    fcn getDeckSize : int
        result upper(deck)
    end getDeckSize
    
    proc discardCard
        new deck, (upper(deck)-1)
    end discardCard
    
    
    fcn drawCard : ^Card
        var tempCard : ^Card := deck(upper(deck))
        discardCard
        result tempCard
    end drawCard
    
    fcn getCard (n : int) : ^Card
        result deck (n)
    end getCard
    
    proc shuffleDeck
        for i : 1 .. 5000
            var tempCardPos1 : int := Rand.Int(lower(deck), upper(deck))
            var tempCardPos2 : int := Rand.Int(lower(deck), upper(deck))    
            var tempCard : ^Card := deck (tempCardPos1)
            deck (tempCardPos1) := deck (tempCardPos2)
            deck (tempCardPos2) := tempCard
        end for
    end shuffleDeck
    
end Deck


