//
//  SearchView.swift
//  StocksApp
//
//  Created by Yusuf Turan on 20.05.2021.
//

import SwiftUI

struct SearchView: View {
  @Binding var searchTerm: String
  var body: some View {
    HStack {
      Spacer()
      Image(systemName: "magnifyingglass")
      TextField("Search", text: self.$searchTerm)
        .foregroundColor(Color.primary)
        .padding(10)
      Spacer()
    }
    .foregroundColor(Color.secondary)
    .background(Color(.secondarySystemBackground))
    .cornerRadius(10)
    .padding()
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(searchTerm: .constant(""))
  }
}
