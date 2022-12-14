//
//  EmojiMemoryGame.swift
//  CS193P21A2
//
//  Created by Karlo Hubak on 30.09.2022..
//  ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static private var vehicleEmojis = ["๐", "๐ด", "โ๏ธ", "๐ต", "โต๏ธ", "๐", "๐", "๐", "๐ป", "๐", "๐", "๐", "๐", "๐", "๐ข", "๐ถ", "๐ฅ", "๐", "๐", "๐"]
    static private var animalEmojis = ["๐ถ", "๐ฑ", "๐ญ", "๐น", "๐ฐ", "๐ฆ", "๐ป", "๐ผ", "๐ปโโ๏ธ", "๐จ", "๐ฏ", "๐ฆ", "๐ฎ", "๐ท", "๐ต"]
    static private var foodEmojis = ["๐", "๐ฅ", "๐", "๐ฅ", "๐ฅ", "๐ฃ", "๐ช", "๐", "๐", "๐ฅ", "๐ญ", "๐ค", "๐ฅ", "๐ฆ", "๐", "๐"]
    static private var heartEmojis = ["โค๏ธ", "๐งก", "๐", "๐", "๐", "๐"]
    static private var sportsEmojis = ["โฝ๏ธ", "๐", "๐", "โพ๏ธ", "๐พ", "๐", "๐ฅ", "๐", "๐ฑ", "๐", "๐ธ", "๐", "๐ฅ", "๐ดโโ๏ธ", "๐", "๐งโโ๏ธ", "๐คบ", "๐", "๐๏ธโโ๏ธ", "โธ", "โท", "๐", "๐คผ"]
    static private var weatherEmojis = ["โ๏ธ", "๐ช", "โ๏ธ", "โ๏ธ", "โ๏ธ"]
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
