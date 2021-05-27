//
//  UserView.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct UserView: View {
  
  @EnvironmentObject var userSettings: UserSettings
  
  var body: some View {
    VStack {
      Text("\(userSettings.score)")
        .font(.system(size: 40, design: .rounded))
      
      Button {
        self.userSettings.score += 1
      } label: {
        Text("Increment Score")
          .padding()
      }
      FancyScoreView()
    }
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
      .environmentObject(UserSettings())
  }
}
