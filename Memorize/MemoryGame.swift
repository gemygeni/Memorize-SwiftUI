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
            cards.append(Card(content: contet))
            cards.append(Card(content: contet))
        }
    }
    
    func choose(_ card : Card)  {
        
    }
    
    struct Card {
        var isFacedUp = false
        var isMatched = false
        var content : CardContent
    }
}
