//
//  Stock.swift
//  StocksApp
//
//  Created by Yusuf Turan on 20.05.2021.
//

import Foundation

struct Stock: Decodable {
  let symbol: String
  let description: String
  let price: Double
  let change: String
}
