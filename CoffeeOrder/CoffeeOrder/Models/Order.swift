//
//  Order.swift
//  CoffeeOrder
//
//  Created by Yusuf Turan on 17.05.2021.
//

import Foundation

struct Order: Codable {
  let name: String
  let size: String
  let coffeeName: String
  let total: Double
}
