//
//  CardView.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct CardView: View {
  @Binding var tapped: Bool
  var body: some View {
    VStack {
      Text("Card")
        .font(.largeTitle)
        .foregroundColor(.white)
    }
    .frame(
      minWidth: 0, maxWidth: .infinity,
      minHeight: 0, maxHeight: .infinity
    )
    .background(self.tapped ? Color.purple : Color.orange)
    .cornerRadius(30)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(tapped: .constant(false))
  }
}
