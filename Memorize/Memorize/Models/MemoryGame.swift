//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cody Morley on 12/7/20.
//

import Foundation

struct MemoryGame<CardContent> {
    //MARK: - Types
    struct Card: Identifiable {
        //MARK: - Card Properties
        var id: Int
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
    
    
    //MARK: - Properties
    var cards: [Card]
    
    
    //MARK: - Init
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2,
                              content: content))
            cards.append(Card(id: pairIndex * 2 + 1,
                              content: content))
        }
    }
    
    
    //MARK: - Methods
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: Bogus.
    }
}
