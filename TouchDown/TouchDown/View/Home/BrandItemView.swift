//
//  BrandItemView.swift
//  TouchDown
//
//  Created by Yusuf Turan on 4.05.2021.
//

import SwiftUI

struct BrandItemView: View {
  // MARK: - PROPERTIES
  var brand: Brand
  
  var body: some View {
    Image(brand.image)
      .resizable()
      .scaledToFit()
      .padding()
      .background(Color.white.cornerRadius(12))
      .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
  }
}

struct BrandItemView_Previews: PreviewProvider {
  static var previews: some View {
    BrandItemView(brand: brands[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
