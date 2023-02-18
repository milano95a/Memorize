//
//  ContentView.swift
//  Memorize
//
//  Created by Workspace on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚛", "🚜", "🚃", "🚒", "🚗", "🚕", "🚙", "🚌", "🚎"]
    @State var emojiCount = 5
    
    var body: some View {
         VStack {
             ScrollView {
                 LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                     ForEach(emojis[0...emojiCount], id: \.self, content: { emoji in
                         CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)              
                     }).foregroundColor(.red)                
                 })
             }
             Spacer()
             HStack {
                 add
                 Spacer()
                 remove
             }.font(.largeTitle)             
        }
        .padding()
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
