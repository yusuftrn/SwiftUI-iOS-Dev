//
// Created by Yusuf Turan on 20.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

class Game: NSObject, Identifiable {
  
  var name: String
  var priceInDollars: Double
  var serialNumber: String
  var dateCreated: Date
  
  init(name: String, priceInDollars: Double, serialNumber: String) {
    self.name = name
    self.priceInDollars = priceInDollars
    self.serialNumber = serialNumber
    self.dateCreated = Date()
  }
  
  // for randomly initialize
  convenience init(random: Bool = false) {
    if random {
      let conditions = ["New", "Mint", "Used"]
      let names = ["Resident Evil", "Gears Of War", "Halo", "God of War"]
      
      var idx = arc4random_uniform(UInt32(conditions.count))
      let randomCondition = conditions[Int(idx)]
      
      idx = arc4random_uniform(UInt32(names.count))
      let randomName = names[Int(idx)]
      
      let randomTitle = "\(randomCondition) \(randomName) \(Int(idx))"
      
      let serialNumber = UUID().uuidString.components(separatedBy: "-").first!
      
      let priceInDollars = Double(arc4random_uniform(UInt32(70)))
      
      self.init(name: randomTitle, priceInDollars: priceInDollars, serialNumber: serialNumber)
    } else {
      self.init(name: "", priceInDollars: 0.0, serialNumber: "")
    }
  }
}
