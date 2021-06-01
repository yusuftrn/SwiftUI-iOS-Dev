//
//  RatingsView.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct RatingsView: View {
  @Binding var rating: Int?
  var body: some View {
    HStack {
      ForEach(1...5, id: \.self) {index in
        Image(systemName: self.starType(index: index))
          .foregroundColor(Color.orange)
          .onTapGesture {
            self.rating = index
          }
      }
    }
  }
  
  func starType(index: Int) -> String {
    if let rating = self.rating {
      return index <= rating ? "star.fill" : "star"
    } else {
      return "star"
    }
  }
}

extension Image {
  func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: width, height: height, alignment: .center)
  }
}

struct RatingsView_Previews: PreviewProvider {
  static var previews: some View {
    RatingsView(rating: .constant(3))
  }
}
