//
//  RatingTest.swift
//  SwifUISamples
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct RatingTest: View {
  @State private var rating: Int?
  var body: some View {
    VStack {
      RatingView(rating: $rating)
      Text(rating != nil ? "You rating: \(rating!)" : "")
    }
  }
}


struct RatingTest_Previews: PreviewProvider {
  static var previews: some View {
    RatingTest()
  }
}
