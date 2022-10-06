//
//  ContentView.swift



import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🚗", "🚕", "🚌", "🏎", "🚓", "🚔", "🚞", "✈️"]
    @State var emojiCount = 8
    
    var body: some View {
        Text("Memorize!")
            .padding(.vertical)
            .font(.largeTitle)
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }.padding(.horizontal).foregroundColor(.red)

            }
            HStack {
                Spacer()
                Vehicles
                Spacer()
                Objects
                Spacer()
                Flags
                Spacer()
            }.padding(.horizontal).font(.largeTitle)
            Spacer()
        }
    }
    
    var Vehicles: some View {
        Button {
            emojis = ["🚗", "🚕", "🚌", "🏎", "🚓", "🚔", "🚞", "✈️"]
            emojis.shuffle()
            emojiCount = 8
        } label: {
            VStack{
                Image(systemName: "car.circle")
                Text("Vehicles").font(.footnote)
            }
        }
    }
    
    var Objects: some View {
        Button {
            emojis = ["💽", "📞", "🔋", "📻", "⏰", "💡", "🎛", "🪔"]
            emojis.shuffle()
            emojiCount = 5
        } label: {
            VStack{
                Image(systemName: "folder.circle")
                Text("Objects").font(.footnote)
            }}
    }
    
    var Flags: some View {
        Button {
            emojis = ["🇦🇽", "🇩🇿", "🇧🇩", "🇧🇷", "🏁", "🇦🇩", "🇧🇦", "🇮🇴"]
            emojis.shuffle()
            emojiCount = 6
        } label: {
            VStack{
                Image(systemName: "flag.circle")
                Text("Flags").font(.footnote)
            }}
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
