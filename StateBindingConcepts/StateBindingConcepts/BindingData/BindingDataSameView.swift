//
//  BindingDataSameView.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct BindingDataSameView: View {
  
  @State var name: String = ""
  
  private func printName() {
    print(self.name)
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(name)
      TextField("Username", text: $name)
      Button {
        printName()
      } label: {
        Text("Show Name Value")
      }
    }
    .padding()
  }
}

struct BindingDataSameView_Previews: PreviewProvider {
  static var previews: some View {
    BindingDataSameView()
  }
}
