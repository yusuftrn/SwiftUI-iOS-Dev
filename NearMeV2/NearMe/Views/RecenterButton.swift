//
//  RecenterButton.swift
//  NearMe
//
//  Created by Yusuf Turan on 3.06.2021.
//

import SwiftUI

struct RecenterButton: View {
  let onTapped: () -> ()
  var body: some View {
    Button(action: onTapped, label: {
      Label("Re-center", systemImage: "triangle")
    })
    .padding(10)
    .foregroundColor(.white)
    .background(Color.blue)
    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
    .padding(.bottom, 10)
  }
}

struct RecenterButton_Previews: PreviewProvider {
  static var previews: some View {
    RecenterButton(onTapped: {})
  }
}
