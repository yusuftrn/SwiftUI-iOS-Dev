//
// Created by Yusuf Turan on 15.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct FruitHeaderView: View {
  // MARK: - PROPERTIES
  var fruit: Fruit
  @State private var isAnimatingImage: Bool = false
  
  // MARK: - VIEW MODIFIERS
  struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .scaledToFit()
        .padding(.vertical, 20)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
    }
  }
  
  struct ZStackModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .frame(height: 440)
    }
  }
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomLeading)
      
      Image(fruit.image)
        .resizable()
        .modifier(ImageModifier())
        .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        
    }//: ZSTACK
    .modifier(ZStackModifier())
    .onAppear() {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimatingImage = true
      }
    }
    
  }
}

// MARK: - PREVIEW
struct FruitHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    FruitHeaderView(fruit: fruitsData[0])
      .previewLayout(.fixed(width: 375, height: 440))
  }
}
