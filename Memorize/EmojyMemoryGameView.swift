//
//  EmojyMemoryGameView.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 07/12/2022.
//

    import SwiftUI

    struct EmojyMemoryGameView: View {
       @ObservedObject var viewModel : EmojyMemoryGame
        var body: some View {
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                CardView(card : card)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                     }
                  }
                .foregroundColor(.red)
                .padding(.horizontal)
             }
         }


    struct CardView : View{
        let card  : EmojyMemoryGame.Card
        var body: some View{
            GeometryReader { geometry in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: drawingConstants.cornerRadius)
                    if card.isFacedUp {
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: drawingConstants.lineWidth )
                        Pie(startAngel: Angle(degrees: 0-90), endAngel: Angle(degrees: 110-90))
                            .opacity(0.5).padding(5)

                        Text(card.content).font(font(of: geometry.size))
                            .fontWeight(.heavy)
                        
                    } else if card.isMatched{
                        shape.opacity(0)
                    }else{
                        shape.fill()
                    }
                }
            }
        }
        
        private struct drawingConstants{
            static let cornerRadius : CGFloat = 10
            static let lineWidth : CGFloat = 3
            static let fontScale : CGFloat = 0.7
        }
        func font(of size : CGSize) -> Font {
Font.system(size: min(size.width, size.height) * drawingConstants.fontScale)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojyMemoryGame()
            game.choose(game.cards.first!)
           return EmojyMemoryGameView(viewModel: game)
        }
    }
