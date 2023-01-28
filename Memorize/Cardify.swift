//
//  Cardify.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 24/01/2023.
//

import SwiftUI
struct Cardify : AnimatableModifier{
    
    var rotation : Double
    var animatableData: Double{
        get{
           rotation
        }
        set{
        rotation = newValue
        }
    }
    init(isFacedUp : Bool) {
        rotation = isFacedUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: drawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: drawingConstants.lineWidth )
               
            }else{
                shape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0)
        }.rotation3DEffect(Angle(degrees: rotation) , axis: (0,1,0))
    }
    
    private struct drawingConstants{
        static let cornerRadius : CGFloat = 10
        static let lineWidth : CGFloat = 3
    }
 }

extension View {
    func cardify(isFacedUp : Bool) -> some View{
        self.modifier(Cardify(isFacedUp: isFacedUp))
    }
}
