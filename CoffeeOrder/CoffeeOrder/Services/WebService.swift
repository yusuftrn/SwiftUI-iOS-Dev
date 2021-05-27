//
//  WebService.swift
//  CoffeeOrder
//
//  Created by Yusuf Turan on 17.05.2021.
//

import Foundation

class WebService {
  
  private let serviceURL: String = "https://island-bramble.glitch.me/orders"
  
  func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
    guard let url = URL(string: serviceURL) else {
      fatalError("Invalid URL")
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode(order)
    URLSession.shared.dataTask(with: request) { data, response, err in
      guard let data = data, err == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
      DispatchQueue.main.async {
        completion(createOrderResponse)
      }
    }.resume()
  }
  
  func getAllOrders(completion: @escaping ([Order]?) -> ()) {
    guard let url = URL(string: serviceURL) else {
      completion(nil)
      return
    }
    URLSession.shared.dataTask(with: url) { data, response, err in
      guard let data = data, err == nil else {
        DispatchQueue.main.async {
          completion(nil)
        }
        return
      }
      let orders = try? JSONDecoder().decode([Order].self, from: data)
      DispatchQueue.main.async {
        completion(orders)
      }
      
    }.resume()
  }
}
