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
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))])  {
                        ForEach(viewModel.cards) { card in
                            CardView(card : card).aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                 }
                               }
                          }
                      }
                .foregroundColor(.red)
                .foregroundColor(.red)
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
            static let cornerRadius : CGFloat = 20
            static let lineWidth : CGFloat = 3
            static let fontScale : CGFloat = 0.8
        }
        func font(of size : CGSize) -> Font {
Font.system(size: min(size.width, size.height) * drawingConstants.fontScale)
        }
        
        
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojyMemoryGame()
            EmojyMemoryGameView(viewModel: game)
        }
    }
