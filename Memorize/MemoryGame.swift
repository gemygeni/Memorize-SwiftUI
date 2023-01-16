//
//  MemoryGame.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 10/01/2023.
//

import Foundation
struct MemoryGame<CardContent>{
    
    private(set) var cards : Array<Card>
    
    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in (0 ..< numberOfPairsOfCards){
            let contet = createCardContent(pairIndex)
            cards.append(Card(content: contet ,id: pairIndex*2))
            cards.append(Card(content: contet , id: pairIndex*2+1 ))
        }
    }
    
 mutating func choose(_ card : Card)  {
        for chosenCardIndex in cards.indices{
            if card.id == cards[chosenCardIndex].id{
                cards[chosenCardIndex].isFacedUp.toggle()
            }
        }
        print("very good")
    }
    
    struct Card : Identifiable {
        var isFacedUp = true
        var isMatched = false
        var content : CardContent
        var id: Int
    }
}
