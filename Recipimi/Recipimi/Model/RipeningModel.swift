//
//  RipeningModel.swift
//  Recipimi
//
//  Created by Yusuf Turan on 10.05.2021.
//

import SwiftUI

struct Ripening: Identifiable {
  var id = UUID()
  var image: String
  var stage: String
  var title: String
  var description: String
  var ripeness: String
  var instruction: String
}
