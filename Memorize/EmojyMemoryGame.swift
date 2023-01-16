//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 10/01/2023.
//

import Foundation
class EmojyMemoryGame : ObservableObject{
    static var emojis  = ["⌚️","📱","🖥","🖲","💽","🗜","🕹","🖨","🖱","💿","💾","🚗","🚕","🚌","🚎","🏎","🚒","🚑","🍆","🥬","🧅","🫒","🫑","🌶","🍠","🧀"]
    
 @Published  private var model : MemoryGame<String> = createMemoryGame()

   static func createMemoryGame() -> MemoryGame<String>{
       return  MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
           return emojis[pairIndex]
       }
    }
    
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card :MemoryGame<String>.Card ){
        model.choose(card)
    }
}
