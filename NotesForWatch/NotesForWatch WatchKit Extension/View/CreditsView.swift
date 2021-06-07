//
//  CreditsView.swift
//  NotesForWatch WatchKit Extension
//
//  Created by Yusuf Turan on 7.06.2021.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack(spacing: 3) {
      Image("developer-no1")
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      HeaderView(title: "Developer")
      /// Content
      Text("Yusuf Turan")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      Text("Swift Hacker")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    }
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
