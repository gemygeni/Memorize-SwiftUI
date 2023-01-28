//
//  EmojyMemoryGameView.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 07/12/2022.
//

    import SwiftUI

    struct EmojyMemoryGameView: View {
       @ObservedObject var game : EmojyMemoryGame
        
        var body: some View {
            VStack{
            gameBody
            deck
            shuffle
             }.padding()
         }
        
        
        @State private var dealt = Set<Int>()
     private func deal (_ card : EmojyMemoryGame.Card){
         dealt.insert(card.id)
        }
        
        private func isUnDealt(_ card : EmojyMemoryGame.Card)-> Bool{
            return !dealt.contains(card.id)
        }
        
        @Namespace private var  dealingNameSpace
        var gameBody : some View{
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                if isUnDealt(card) || card.isMatched && !card.isFacedUp{
                    Color.clear
                }else{
                    CardView(card : card)
                        .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 1)) {
                                game.choose(card)
                            }
                     }
                }
            })                .foregroundColor(.red)
        }
        
        var shuffle : some View{
            Button("shuffle"){
                withAnimation {
                    game.shuffle()
                }
            }
        }
        
        
        
                var deck : some View{
                    ZStack{
                        ForEach(game.cards.filter(isUnDealt)){ card in
                            CardView(card: card)
                                .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                                .transition(.asymmetric(insertion: .opacity, removal: .scale))

                        }
                    }.frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
                        .foregroundColor(.red)
                        .onTapGesture(){
                            withAnimation(.easeIn(duration: 3)) {
                                game.cards.forEach { card in
                                    deal(card)
                                }
                            }
                        }
                }

        private struct CardConstants {
            static let color = Color.red
            static let aspectRatio: CGFloat = 2/3
            static let dealDuration: Double = 0.5
            static let totalDealDuration: Double = 2
            static let undealtHeight: CGFloat = 90
            static let undealtWidth = undealtHeight * aspectRatio
        }

        
        
        
    }


    struct CardView : View{
        let card  : EmojyMemoryGame.Card
        var body: some View{
            GeometryReader { geometry in
                ZStack {
                        Pie(startAngel: Angle(degrees: 0-90), endAngel: Angle(degrees: 110-90))
                            .opacity(0.5).padding(5)
                        Text(card.content).rotationEffect(Angle(degrees: card.isMatched ? 360 : 0)).animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: card.isMatched)
                        .font(Font.system(size: drawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
                }
                .cardify(isFacedUp: card.isFacedUp)
            }
        }
        
        private func scale(thatFits size : CGSize) -> CGFloat{
            
            min(size.width, size.height) / (drawingConstants.fontSize / drawingConstants.fontScale)
        }
        
        private struct drawingConstants{
            static let fontScale : CGFloat = 0.7
            static let fontSize : CGFloat = 32
        }
        func font(of size : CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * drawingConstants.fontScale)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojyMemoryGame()
            game.choose(game.cards.first!)
           return EmojyMemoryGameView(game : game)
        }
    }
