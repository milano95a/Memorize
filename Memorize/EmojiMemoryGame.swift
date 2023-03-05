//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Workspace on 24/02/23.
//

import Foundation

// ViewModel
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["✈️", "🚛", "🚜", "🚃", "🚒", "🚗", "🚕", "🚙", "🚌", "🚎"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String> (numberOfPairOfCards: 3) { index in
            emojis[index]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        
        let hello: String? = "hello world"
        
        switch hello {
            case .none:             print("none")
            case .some(let str):    print(str)
        }
        
        return model.cards
    }
    
    
    
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
