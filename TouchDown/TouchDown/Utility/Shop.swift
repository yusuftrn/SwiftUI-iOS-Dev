//
//  Shop.swift
//  TouchDown
//
//  Created by Yusuf Turan on 6.05.2021.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? = nil
}
