
import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "🚛", "🚜", "🚃", "🚒", "🚗", "🚕", "🚙", "🚌", "🚎"] {
        didSet {
            let randomInt = Int.random(in: 4..<emojis.count)
            emojiCount = randomInt
        }
    }
    @State var emojiCount = 4
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits()))], content: {
                        ForEach(0..<emojiCount, id: \.self, content: { index in
                            CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
                        }).foregroundColor(.red)                
                    })
                }
                Spacer()
                 HStack {
                     fruitTheme
                     Spacer()
                     transportTheme
                     Spacer()
                     animalTheme
                 }.font(.largeTitle)             
            }
            .padding()
            .navigationTitle("Memorize")
        }
    }
    
    var fruitTheme: some View {
        Button(action: {
            emojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "leaf")
                Text("Fruit")
                    .font(.body)
            }
        })
    }
    
    var transportTheme: some View {
        Button(action: {
            emojis = ["✈️", "🚛", "🚜", "🚃", "🚒", "🚗", "🚕", "🚙"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "car.circle")
                Text("Vehicles")
                    .font(.body)
            }
        })
    }
    
    var animalTheme: some View {
        Button(action: {
            emojis = ["🐶", "🐱", "🦊", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "pawprint.circle")
                Text("Animals")
                    .font(.body)
            }
        })
    }    
    
    func widthThatBestFits() -> CGFloat {
        return 500/CGFloat(emojiCount)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text("\(content)").font(.largeTitle)                
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}











































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
