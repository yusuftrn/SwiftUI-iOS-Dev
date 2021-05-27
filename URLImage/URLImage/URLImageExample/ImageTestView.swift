//
//  ImageTestView.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct ImageTestView: View {
  var body: some View {
    ImageViewer(url: "https://randomuser.me/api/portraits/men/81.jpg")
  }
}

struct ImageTestView_Previews: PreviewProvider {
  static var previews: some View {
    ImageTestView()
  }
}
