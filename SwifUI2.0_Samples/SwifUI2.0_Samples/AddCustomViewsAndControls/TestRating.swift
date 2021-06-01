//
//  TestRating.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct TestRating: View {
  
  @State private var rating: Int?
  
  var body: some View {
    VStack {
      Image("coffee")
        .resizedToFill(width: 150, height: 160)
      RatingsView(rating: /*@START_MENU_TOKEN@*/.constant(3)/*@END_MENU_TOKEN@*/)
      Text(rating != nil ? "You rating: \(rating!)" : " ")
    }
  }
}



struct TestRating_Previews: PreviewProvider {
  static var previews: some View {
    TestRating()
  }
}
