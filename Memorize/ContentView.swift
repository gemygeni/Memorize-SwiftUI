//
//  ContentView.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 07/12/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis  = ["⌚️","📱","🖥","🖲","💽","🗜","🕹","🖨","🖱","💿","💾","🚗","🚕","🚌","🚎","🏎","🚒","🚑","🍆","🥬","🧅","🫒","🫑","🌶","🍠","🧀"]

    @State var emojiCount = 20
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))])  {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content : emoji).aspectRatio(2/3, contentMode: .fit)
                        }.foregroundColor(.red)
                    Spacer()
                    
                }.foregroundColor(.red)
            }
            HStack{
                remove
                Spacer()
                add
            }.font(.largeTitle).padding(.horizontal)
        }.padding(.horizontal)
        
        }
    
    var remove : some View{
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add : some View{
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView : View{
    var content : String
 @State var isFacedUp = true
    var body: some View{
        ZStack {
        let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFacedUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3 )
                Text(content).font(.largeTitle)
                    .fontWeight(.heavy)
                  
            }
            else{
                shape .fill()
            }

        }.onTapGesture {
            isFacedUp = !isFacedUp
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
