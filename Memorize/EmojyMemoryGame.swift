//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 10/01/2023.
//

import Foundation
class EmojyMemoryGame{
    static var emojis  = ["⌚️","📱","🖥","🖲","💽","🗜","🕹","🖨","🖱","💿","💾","🚗","🚕","🚌","🚎","🏎","🚒","🚑","🍆","🥬","🧅","🫒","🫑","🌶","🍠","🧀"]
    
   static func createMemoryGame() -> MemoryGame<String>{

       MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
           emojis[pairIndex]
       }
    }
    
    private var model : MemoryGame<String> = createMemoryGame()
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }

}
