//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Cody Morley on 12/7/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
