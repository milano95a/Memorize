//
//  MemoryGame.swift
//  Memorize
//
//  Created by Workspace on 23/02/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatch
        {
            if let potentialMatchIndex = indexOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatch = true
                    cards[potentialMatchIndex].isMatch = true
                }
                indexOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()    
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
        var id: Int
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairOfCards {
            let content = createCardContent(index)
            cards.append(Card(content: content, id: index*2))
            cards.append(Card(content: content, id: index*2+1))
        }
    }
}
