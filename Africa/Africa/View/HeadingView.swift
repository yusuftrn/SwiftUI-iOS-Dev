//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct HeadingView: View {

  var headingImage: String
  var headingText: String

  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)

      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    }
  }
}

struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
