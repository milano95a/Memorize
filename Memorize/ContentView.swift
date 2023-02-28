
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits()))], content: {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }.foregroundColor(.red)                
                })
            }            
            .padding()
            .navigationTitle("Memorize")
        }
    }
    
    func widthThatBestFits() -> CGFloat {
        return 500/CGFloat(viewModel.cards.count)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text("\(card.content)").font(.largeTitle)                
            } else if card.isMatch {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}











































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
