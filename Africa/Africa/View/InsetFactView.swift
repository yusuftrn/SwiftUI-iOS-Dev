//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct InsetFactView: View {

  let animal: Animal

  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        }
      }
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    }
  }
}

struct InsetFactView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  static var previews: some View {
    InsetFactView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
