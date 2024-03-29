//
//  ContentView.swift
//  Memorize
//
//  Created by jzy on 2022/7/19.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😗", "⏰","✈️", "👀", "💡","📬", "📈", "🎽", "🛷", "🚎", "📏", "🇵🇬", "🪳", "🙉", "↗️"]
    
    @State var emojiCount: Int = 4

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            HStack {
                remove
                Spacer()
                add

            }
            .padding(.horizontal)
            .font(.largeTitle)
            
        }
        .padding(.horizontal)
        
      
    }
    
    var add: some View {
         Button {
             if (emojiCount < emojis.count) {
                 emojiCount += 1
             }
        
         } label:{
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }
    
    var remove: some View {
        Button{
            if (emojiCount > 1) {
                emojiCount  -= 1
            }
        } label:{
            VStack {
                VStack {
                    Image(systemName: "minus.circle")
                }
            }
        }
    }
     
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius:20)
            if (isFaceUp) {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 8)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }

}














// 将previewer关联到ContentView的代码
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
            
    }
}
