//
//  FooterView.swift
//  TouchDown
//
//  Created by Yusuf Turan on 1.05.2021.
//

import SwiftUI

struct FooterView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(2)
      
      Image("logo-lineal")
        .renderingMode(.template)
        .foregroundColor(.gray)
        .layoutPriority(0)
      
      Text("Copyright (C) - Yusuf Turan.\nAll right reserved.")
        .font(.footnote)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .layoutPriority(1)
    }
    .padding()
  }
}

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
