//
//  CS193P21A2App.swift
//  CS193P21A2
//
//  Created by Karlo Hubak on 30.09.2022..
//

import SwiftUI

@main
struct CS193P21A2App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
