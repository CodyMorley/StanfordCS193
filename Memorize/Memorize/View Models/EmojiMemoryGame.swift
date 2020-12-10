//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cody Morley on 12/7/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //MARK: - Static Methods
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🎅🏼", "🎄", "🦌"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    //MARK: - Properties
    @Published private var game: MemoryGame<String> = createMemoryGame()
    ///Access to the model.
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    
    //MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
