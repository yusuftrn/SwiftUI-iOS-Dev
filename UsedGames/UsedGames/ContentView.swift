//
// Created by Yusuf Turan on 20.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var gameStore = GameStore()
  @State var gameToDelete: Game?

  var body: some View {
    NavigationView {
      List {
        ForEach(gameStore.games) { game in
          NavigationLink(
            destination: GameDetailView(
              game: game,
              gameStore: gameStore,
              name: game.name,
              price: game.priceInDollars
            )
          ) {
            GameListItem(game: game)
          }
        }
        .onDelete(perform: { index in
          self.gameToDelete = gameStore.game(at: index)
        })
        .onMove(perform: gameStore.move)
      }
      .listStyle(PlainListStyle())
      .navigationBarTitle("Used Game Store", displayMode: .inline)
      .navigationBarItems(
        leading:
          trailingItem(),
        trailing:
          leadingItem()
      )
      .animation(.easeIn)
      .actionSheet(item: $gameToDelete) { (game)-> ActionSheet in
        ActionSheet(title: Text("Are you sure?"), message: Text("You will delete \(game.name)"), buttons: [
          ActionSheet.Button.cancel(),
          ActionSheet.Button.destructive(Text("Delete"), action: {
            if let indexSet = gameStore.indexSet(for: game) {
              gameStore.delete(whichElement: indexSet)
            }
          })
        ])
      }
    }
  }

  private func trailingItem() -> some View {
    return Group {
      if gameStore.games.count > 0 {
        EditButton()
      }
    }
  }

  private func leadingItem() -> some View {
    return Group {
      Button(action: {
        gameStore.createGame()
      }, label: {
        Text("Add")
        Image(systemName: "plus")
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
