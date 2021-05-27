//
// Created by Yusuf Turan on 19.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI



class EmojiMemoryGame: ObservableObject {
  
  @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
  
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis: Array<String> = ["👻", "🎃", "🕷"]
    return MemoryGame<String>(numberOfPairsCards: emojis.count, cardContentFactory: { index in emojis[index] })
  }
    
  // MARK: - Access to the Model
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  // MARK: - Intents
  func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
  
}
