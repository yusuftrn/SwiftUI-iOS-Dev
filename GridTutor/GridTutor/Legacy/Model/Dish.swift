//
//  Dish.swift
//  GridTutor
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation

struct Dish: Identifiable {
  let id = UUID()
  let name: String
  let price: Double
  let image: String
}

extension Dish {
  static func all() -> [Dish] {
    return [
      Dish(name: "Filet Mignon", price: 35, image: "🫔"),
      Dish(name: "Makarna", price: 35, image: "🍗"),
      Dish(name: "Spagetti Makarna", price: 35, image: "🍕"),
      Dish(name: "Wooper King", price: 35, image: "🍿"),
      Dish(name: "Bomburger", price: 35, image: "🍢"),
      Dish(name: "Grid Style Food", price: 35, image: "🍩"),
      Dish(name: "Sushi Lemonade", price: 35, image: "🍝"),
      Dish(name: "IceCream", price: 35, image: "🧆"),
    ]
  }
}
