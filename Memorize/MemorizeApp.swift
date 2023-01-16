//
//  MemorizeApp.swift
//  Memorize
//
//  Created by AHMED GAMAL  on 07/12/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojyMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
