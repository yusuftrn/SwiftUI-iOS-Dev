//
//  StockViewModel.swift
//  StocksApp
//
//  Created by Yusuf Turan on 20.05.2021.
//

import Foundation

struct StockViewModel {
  
  let stock: Stock
  
  var symbol: String {
    return self.stock.symbol.uppercased()
  }
  var description: String {
    return self.stock.description
  }
  var price: String {
    return String(format: "%.2f", self.stock.price)
  }
  var change: String {
    return self.stock.change
  }
}
