//
// Created by Yusuf Turan on 20.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct GameListItem: View {
  var game: Game
  var numberFormatter: NumberFormatter = Formatters.dollarFormatter
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4.0) {
        Text(game.name)
          .font(.body)
        Text(game.serialNumber)
          .font(.caption)
          .foregroundColor(.secondary)
      }
      Spacer()
      Text(NSNumber(value: game.priceInDollars), formatter: numberFormatter)
        .font(.title2)
        .foregroundColor(game.priceInDollars > 30 ? .blue : .gray)
        .animation(nil)
    }
    .padding(.vertical, 4)
  }
}

struct GameListItem_Previews: PreviewProvider {
  static var previews: some View {
    GameListItem(game: Game(random: true))
  }
}
