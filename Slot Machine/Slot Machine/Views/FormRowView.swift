//
//  FormRowView.swift
//  Slot Machine
//
//  Created by Yusuf Turan on 10.05.2021.
//

import SwiftUI

struct FormRowView: View {
  // MARK: - PROPERTIES
  var firstItem: String
  var secondItem: String
  // MARK: - BODY
  var body: some View {
    HStack {
      Text(firstItem)
        .foregroundColor(.gray)
      Spacer()
      Text(secondItem)
    }
  }
}

struct FormRowView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowView(firstItem: "Selam", secondItem: "Test")
  }
}
