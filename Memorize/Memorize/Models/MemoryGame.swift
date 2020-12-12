//
//  MemoryGame.swift
//  Memorize
//
//  Created by Cody Morley on 12/7/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    //MARK: - Types
    struct Card: Identifiable {
        //MARK: - Card Properties
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
    
    //MARK: - Properties
    var cards: [Card]
    var indexOfOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
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
        if let chosenIndex = cards.firstIndexMatching(matching: card),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            } else {
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
    }
}
