//
//  EmojiMemoryGame.swift
//  CS193P21A2
//
//  Created by Karlo Hubak on 30.09.2022..
//  ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static private var vehicleEmojis = ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶", "🛥", "🚞", "🚟", "🚃"]
    static private var animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐵"]
    static private var foodEmojis = ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚", "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"]
    static private var heartEmojis = ["❤️", "🧡", "💛", "💚", "💙", "💜"]
    static private var sportsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏉", "🥏", "🏐", "🎱", "🏓", "🏸", "🏒", "🥊", "🚴‍♂️", "🏊", "🧗‍♀️", "🤺", "🏇", "🏋️‍♀️", "⛸", "⛷", "🏄", "🤼"]
    static private var weatherEmojis = ["☀️", "🌪", "☁️", "☔️", "❄️"]
    static private var themes = Array<Theme>()
    private(set) var chosenTheme: Theme
    
    static func createTheme(_ name: String, _ emojis: [String], _ defaultPairsOfCards: Int) -> Theme {
        var numberOfPairsOfCards = defaultPairsOfCards
        
        if emojis.count < defaultPairsOfCards {
            numberOfPairsOfCards = emojis.count
        }
        
        return Theme(name: name, emojis: emojis.shuffled(), numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    static func createThemeCollection() {
        themes.append(Theme(name: "Vehicles", emojis: vehicleEmojis, numberOfPairsOfCards: vehicleEmojis.count))
        themes.append(Theme(name: "Animals", emojis: animalEmojis, numberOfPairsOfCards: animalEmojis.count))
        themes.append(Theme(name: "Food", emojis: foodEmojis, numberOfPairsOfCards: foodEmojis.count))
        themes.append(Theme(name: "Hearts", emojis: heartEmojis, numberOfPairsOfCards: heartEmojis.count))
        themes.append(Theme(name: "Sports", emojis: sportsEmojis, numberOfPairsOfCards: sportsEmojis.count))
        themes.append(Theme(name: "Weather", emojis: weatherEmojis, numberOfPairsOfCards: weatherEmojis.count))
    }
    
    static func createMemoryGame(of chosenTheme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: chosenTheme.numberOfPairsOfCards) { pairIndex in
            chosenTheme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    static func choseTheme() -> Theme {
        EmojiMemoryGame.themes.randomElement()!
    }
    
    init() {
        EmojiMemoryGame.createThemeCollection()
        chosenTheme = EmojiMemoryGame.choseTheme()
        model = EmojiMemoryGame.createMemoryGame(of: chosenTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
