//
//  ContentView.swift
//  MVVMSample
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI

struct ContentView: View {
  
  public let dummyUsers: [MVVMUser] = [
    MVVMUser(uid: 0, firstName: "Alex", lastName: "Nagy", email: "alex@nomail.com", avatarURL:"https://robohash.org/7NL.png?size=150x150"),
    MVVMUser(uid: 0, firstName: "Alex", lastName: "Nagy", email: "alex@nomail.com", avatarURL:"https://robohash.org/7AL.png?size=150x150"),
  ]
  
  @State private var animationState: Bool = false
  
  init() {
    UITableView.appearance().separatorColor = .clear
  }
  
  var body: some View {
    VStack() {
      List(dummyUsers) { user in
        RowView(user: user).frame(height: 250)
      }
      Button {
        print("Fetching...")
      } label: {
        ZStack {
          Rectangle()
            .frame(width: 120, height: 40, alignment: .center)
            .foregroundColor(Color.blue)
            .cornerRadius(10)
          Text("Fetch")
            .foregroundColor(Color.white)
        }
      }
      .scaleEffect(animationState ? 1 : 1.2)
      .animation(Animation.easeOut(duration: 2).repeatForever())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
