//
// Created by Yusuf Turan on 15.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct FruitRowView: View {
  // MARK: - PROPERTIES
  var fruit: Fruit
  
  // MARK: - VIEW MODIFIERS
  struct HStackModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .scaledToFit()
        .frame(width: 80, height: 80, alignment: .center)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3),
                radius: 3, x: 2, y: 2)
        .cornerRadius(8)
    }
  }
  
  struct VStackTitle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(Font.custom("Arial Rounded MT Bold", size: 20))
    }
  }
  
  struct VStackCaption: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.caption)
        .foregroundColor(Color.secondary)
    }
  }
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Image(fruit.image)
        .resizable()
        .renderingMode(.original)
        .modifier(HStackModifier())
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
      
      VStack(alignment: .leading, spacing: 5) {
        Text(fruit.title)
          .modifier(VStackTitle())
        Text(fruit.headline)
          .modifier(VStackCaption())
      }
    } //: HSTACK
  }
}

// MARK: - PREVIEW
struct FruitRowView_Previews: PreviewProvider {
  static var previews: some View {
    FruitRowView(fruit: fruitsData[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
