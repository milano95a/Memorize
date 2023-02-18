//
//  ContentView.swift
//  Memorize
//
//  Created by Workspace on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "🚛", "🚜", "🚃", "🚒", "🚗", "🚕", "🚙", "🚌", "🚎"]
    @State var emojiCount = 5
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], content: {
                        ForEach(emojis, id: \.self, content: { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)              
                        }).foregroundColor(.red)                
                    })
                }
                Spacer()
                 HStack {
//                     add
//                     Spacer()
//                     remove
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
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count-1 {
                emojiCount += 1                
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
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
