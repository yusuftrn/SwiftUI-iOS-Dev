//
//  FactsModel.swift
//  Recipimi
//
//  Created by Yusuf Turan on 8.05.2021.
//

import SwiftUI

struct Fact: Identifiable {
  var id: UUID = UUID()
  var image: String
  var content: String
}
