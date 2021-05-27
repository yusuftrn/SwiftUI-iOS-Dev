//
// Created by Yusuf Turan on 20.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

struct Formatters {
  static let dollarFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencySymbol = "$"
    formatter.currencyCode = "USD"
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    return formatter
  }()
}
