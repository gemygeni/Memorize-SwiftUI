//
//  ContentView.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 07/12/2022.
//

    import SwiftUI

    struct ContentView: View {
       @ObservedObject var viewModel : EmojyMemoryGame
        var body: some View {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))])  {
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
        let card  : MemoryGame<String>.Card
        var body: some View{
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFacedUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3 )
                    Text(card.content).font(.largeTitle)
                        .fontWeight(.heavy)
                }
                else{
                    shape .fill()
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojyMemoryGame()
            ContentView(viewModel: game)
        }
    }
