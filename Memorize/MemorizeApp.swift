//
//  MemorizeApp.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 07/12/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojyMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojyMemoryGameView(viewModel: game)
        }
    }
}
