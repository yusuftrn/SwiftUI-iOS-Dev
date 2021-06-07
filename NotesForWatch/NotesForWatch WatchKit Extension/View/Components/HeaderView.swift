//
//  HeaderView.swift
//  NotesForWatch WatchKit Extension
//
//  Created by Yusuf Turan on 7.06.2021.
//

import SwiftUI

struct HeaderView: View {
  var title: String  = ""
  var body: some View {
    VStack {
      if title != "" {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      HStack {
        Capsule()
          .frame(height: 1)
        Image(systemName: "note.text")
        Capsule()
          .frame(height: 1)
      }
      .foregroundColor(.accentColor)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeaderView(title: "Credits")
      HeaderView()
    }
  }
}
