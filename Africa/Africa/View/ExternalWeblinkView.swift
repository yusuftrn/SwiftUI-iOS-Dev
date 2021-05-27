//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct ExternalWeblinkView: View {

  let animal: Animal

  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()

        Group {
          Image(systemName: "arrow.up.right.square")
          Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
        }
        .foregroundColor(.accentColor)
      }
    }
    .padding(.horizontal)
  }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    ExternalWeblinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
