//
//  FancyScoreView.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct FancyScoreView: View {
  
  @EnvironmentObject var userSettings: UserSettings
  
  var body: some View {
    VStack {
      Text("\(self.userSettings.score)")
        .font(.title)
        .padding()
      Button {
        self.userSettings.score += 1
      } label: {
        Text("Fancy Increment Score")
          .font(.title)
      }
      .padding()
      .background(Color.green)
    }
    .background(Color.orange)
  }
}

struct FancyScoreView_Previews: PreviewProvider {
  static var previews: some View {
    FancyScoreView()
      .environmentObject(UserSettings())
  }
}
