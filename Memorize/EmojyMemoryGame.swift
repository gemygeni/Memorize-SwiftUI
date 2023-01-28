//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 10/01/2023.
//

import Foundation
class EmojyMemoryGame : ObservableObject{
  private static var emojis  = ["⌚️","📱","🖥","🖲","💽","🗜","🕹","🖨","🖱","💿","💾","🚗","🚕","🚌","🚎","🏎","🚒","🚑","🍆","🥬","🧅","🫒","🫑","🌶","🍠","🧀"]
    
 @Published  private var game  = createMemoryGame()
    typealias Card = MemoryGame<String>.Card

  private static func createMemoryGame() -> MemoryGame<String>{
       return  MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
           return emojis[pairIndex]
       }
    }
    
    var cards : Array<Card>{
        return game.cards
    }
    
    func choose(_ card : Card ){
        game.choose(card)
    }
    
    func shuffle (){
        game.shuffle()
    }
}
   
