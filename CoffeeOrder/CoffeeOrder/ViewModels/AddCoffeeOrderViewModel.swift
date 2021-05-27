//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrder
//
//  Created by Yusuf Turan on 17.05.2021.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
  
  private var webservice: WebService
  
  init() {
    self.webservice = WebService()
  }
  
  var name: String = ""
  @Published var size: String = "Medium"
  @Published var coffeeName: String = ""
  
  var total: Double {
    return calculateTotalPrice()
  }
  
  var coffeeList: [CoffeeViewModel] {
      return Coffee.all().map(CoffeeViewModel.init)
  }
  
  public func placeOrder() {
    let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
    
    self.webservice.createCoffeeOrder(order: order) { _ in
      
    }
  }
  
  private func priceForSize() -> Double {
    let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
    return prices[self.size]!
  }
  
  private func calculateTotalPrice() -> Double {
    let coffeeVM = coffeeList.first { $0.name == coffeeName }
    if let coffeeVM = coffeeVM {
      return coffeeVM.price * priceForSize()
    } else {
      return 0.0
    }
  }
}
