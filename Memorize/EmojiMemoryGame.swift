//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Workspace on 24/02/23.
//

import Foundation

// ViewModel
class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["✈️", "🚛", "🚜", "🚃", "🚒", "🚗", "🚕", "🚙", "🚌", "🚎"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String> (numberOfPairOfCards: 3) { index in
            emojis[index]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    
    var cards: Array<MemoryGame<String>.Card> {
        
        let hello: String? = "hello world"
        
        switch hello {
            case .none:             print("none")
            case .some(let str):    print(str)
        }
        
        return model.cards
    }
    
    
    
    // MARK: Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
