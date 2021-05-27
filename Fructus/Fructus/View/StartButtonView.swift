//
// Created by Yusuf Turan on 14.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct StartButtonView: View {
  // MARK: - PROPERTIES
  @AppStorage("isOnboarding") var isOnboarding: Bool?
  
  // MARK: - VIEW MODIFIERS
  struct HStackModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Capsule().strokeBorder(Color.white, lineWidth: 1.25))
    }
  }
  
  struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .accentColor(.white)
    }
  }
  
  // MARK: - BODY
  var body: some View {
    Button(action: {
      isOnboarding = false
    }) {
      HStack(spacing: 8) {
        Text("Start")
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .modifier(HStackModifier())
    }//: BUTTON
    .modifier(ButtonModifier())
  }
}

//MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
  static var previews: some View {
    StartButtonView()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
