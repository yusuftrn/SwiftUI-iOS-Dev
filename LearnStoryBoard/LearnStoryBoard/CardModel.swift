//
//  CardModel.swift
//  LearnStoryBoard
//
//  Created by Yusuf Turan on 7.05.2021.
//

import SwiftUI

// MARK: - CARD MODEL
struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
