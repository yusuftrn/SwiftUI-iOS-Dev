//
// Created by Yusuf Turan on 20.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

class GameStore: ObservableObject {

  @Published var games: [Game] = []

  init() {}

  @discardableResult func createGame() -> Game {
    let game = Game(random: true)
    games.append(game)
    return game
  }

  func delete(whichElement: IndexSet) {
    games.remove(atOffsets: whichElement)
  }

  func move(whichElement: IndexSet, destination: Int) {
    games.move(fromOffsets: whichElement, toOffset: destination)
  }

  func indexSet(for game: Game) -> IndexSet? {
    if let firstIndex = games.firstIndex(of: game) {
      return IndexSet(integer: firstIndex)
    }
    return nil
  }

  func game(at indexSet: IndexSet) -> Game? {
    if let firstIndex = indexSet.first {
      return games[firstIndex]
    }
    return nil
  }

  func update(game: Game, newValue: Game) {
    if let index = games.firstIndex(of: game) {
      games[index] = newValue
    }
  }
}
