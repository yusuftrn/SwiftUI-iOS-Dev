//
//  ContentView.swift
//  LearnStoryBoard
//
//  Created by Yusuf Turan on 7.05.2021.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  var cards: [Card] = cardData
  
  // MARK: - CONTENT
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(cards) { item in
          CardView(card: item)
        }
      }
      .padding(20)
    }
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(cards: cardData)
  }
}
