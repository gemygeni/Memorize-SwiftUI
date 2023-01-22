//
//  Pie.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 22/01/2023.
//

import Foundation
import SwiftUI
struct Pie : Shape{
    var startAngel : Angle
    var endAngel : Angle
    var clockwise = false
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngel.radians)),
            y: center.y + radius * CGFloat(sin(startAngel.radians)))
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngel,
                 endAngle: endAngel,
                 clockwise: !clockwise)
        p.addLine(to: center)
        return p

    }
    
    
}
