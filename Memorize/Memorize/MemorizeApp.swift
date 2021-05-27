//
// Created by Yusuf Turan on 18.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

@main
struct MemorizeApp: App {
  var body: some Scene {
    WindowGroup {
      let game = EmojiMemoryGame()
      EmojiMemoryGameView(viewModel: game)
    }
  }
}
