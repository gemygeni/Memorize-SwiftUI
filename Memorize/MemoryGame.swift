//
//  MemoryGame.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 10/01/2023.
//

import Foundation
struct MemoryGame<CardContent> where CardContent : Equatable{
    
    private(set) var cards : Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard : Int?

    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in (0 ..< numberOfPairsOfCards){
            let contet = createCardContent(pairIndex)
            cards.append(Card(content: contet ,id: pairIndex*2))
            cards.append(Card(content: contet , id: pairIndex*2+1 ))
        }
    }
    
 mutating func choose(_ card : Card)  {
     if let chosenCardIndex = cards.firstIndex(where: {$0.id == card.id}),
        !cards[chosenCardIndex].isMatched,
        !cards[chosenCardIndex].isFacedUp
     {
              if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                  if cards[chosenCardIndex].content == cards[potentialMatchIndex].content{
                      cards[chosenCardIndex].isMatched = true
                      cards[potentialMatchIndex].isMatched = true
                  }
                  indexOfTheOneAndOnlyFaceUpCard = nil
                  
              }
         
         

                  else{
                      for index in cards.indices{
                          cards[index].isFacedUp = false
                      }
                      indexOfTheOneAndOnlyFaceUpCard = chosenCardIndex
                 }
              
              
              cards[chosenCardIndex].isFacedUp.toggle()
       }
    }
    
    struct Card : Identifiable {
        var isFacedUp = false
        var isMatched = false
        var content : CardContent
        var id: Int
    }
}
