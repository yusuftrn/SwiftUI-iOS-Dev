//
// Created by Yusuf Turan on 18.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    HStack {
      ForEach(viewModel.cards){ card in
        CardView(card: card)
          .aspectRatio(1/1, contentMode: .fit)
          .onTapGesture(perform: { viewModel.choose(card: card) })
      }
    }
    .padding()
    .foregroundColor(.orange)
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  //MARK: - Drawing Constants
  let cornerRadius: CGFloat = 10.0
  let edgeLineWidth: CGFloat = 3.0
  let fontScaleFactor: CGFloat = 0.75
  
  func body(for size: CGSize) -> some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
        Text(card.content)
          .modifier(TextModifier())
      } else {
        RoundedRectangle(cornerRadius: cornerRadius).fill()
      }
    }
    .font(Font.system(size: fontSize(for: size)))
  }
  
  func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * fontScaleFactor
  }
  
  var body: some View {
    GeometryReader { geometry in
      self.body(for: geometry.size)
    }
  }
}

private struct TextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Bold", size: 38))
  }
}
