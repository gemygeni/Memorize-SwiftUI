//
//  MemoryGame.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 10/01/2023.
//

import Foundation
import SwiftUI
struct MemoryGame<CardContent> where CardContent : Equatable{
    private(set) var cards : Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard : Int?{
        get{cards.indices.filter{cards[$0].isFacedUp}.oneAndOnly}
        set{cards.indices.forEach {cards[$0].isFacedUp = ($0 == newValue)}}
    }

    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent){
        cards = [ ]
        for pairIndex in (0 ..< numberOfPairsOfCards){
            let contet = createCardContent(pairIndex)
            cards.append(Card(content: contet ,id: pairIndex*2))
            cards.append(Card(content: contet , id: pairIndex*2+1 ))
        }
    }
    
 mutating func choose(_ card : Card)  {
     if let chosenCardIndex = cards.firstIndex(where: {$0.id == card.id}),
        !cards[chosenCardIndex].isMatched,
        !cards[chosenCardIndex].isFacedUp{
              //case of one card is allready facedUp and another one chosen
              if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                  
                  if cards[chosenCardIndex].content == cards[potentialMatchIndex].content{
                      cards[chosenCardIndex].isMatched = true
                      cards[potentialMatchIndex].isMatched = true
                  }
                  
                  cards[chosenCardIndex].isFacedUp = true
               }
              //case of no one and only one card facedUp
                  else{
                      indexOfTheOneAndOnlyFaceUpCard = chosenCardIndex
                 }
              
             }
          }
    
    struct Card : Identifiable {
        var isFacedUp = false
        var isMatched = false
        let content : CardContent
        let id: Int
    }
}

extension Array{
    var oneAndOnly : Element?{
        if count == 1{
            return first
        }
        else{
            return nil
        }
    }
}
