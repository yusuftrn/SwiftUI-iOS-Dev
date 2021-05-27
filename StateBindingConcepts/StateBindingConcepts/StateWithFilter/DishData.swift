//
//  DishData.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation

struct Dish: Identifiable {
  let id = UUID()
  let name: String
  let imageURL: String
  let isSpicy: Bool
}

extension Dish {
  static func all() -> [Dish] {
    return [
      Dish(name: "Kung Pow Chicken", imageURL: "🍗", isSpicy: true),
      Dish(name: "Sweet and Sour Chicken", imageURL: "🍖", isSpicy: false),
      Dish(name: "Spicy Red Chicken", imageURL: "🌯", isSpicy: true),
    ]
  }
}
