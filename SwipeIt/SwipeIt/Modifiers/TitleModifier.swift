//
//  TitleModifier.swift
//  SwipeIt
//
//  Created by Yusuf Turan on 15.05.2021.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(Color.pink)
  }
}

