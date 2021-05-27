//
// Created by Yusuf Turan on 14.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct FruitCardView: View {
  // MARK - PROPERTIES
  var fruit: Fruit
  @State private var isAnimating: Bool = false
  

  // MARK: - VIEW MODIFIERS
  
  struct BodyModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .foregroundColor(Color.white)
        .font(Font.custom("Arial Rounded MT Bold", size: 40))
    }
  }
  
  struct FruitTitle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .foregroundColor(Color.white)
        .font(Font.custom("Arial Rounded MT Bold", size: 40))
    }
  }
  
  struct FruitHeadline: ViewModifier {
    func body(content: Content) -> some View {
      content
        .foregroundColor(Color.white)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 16)
        .frame(maxWidth: 480)
    }
  }
  
  struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
      content
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 6)
    }
  }
  
  // MARK - BODY
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        // FRUIT: IMAGE
        Image(fruit.image)
          .resizable()
          .scaledToFit()
          .modifier(Shadow())
      
        // FRUIT: TITLE
        Text(fruit.title)
          .modifier(FruitTitle())
          .modifier(Shadow())
        
        // FRUIT: HEADLİNE
        Text(fruit.headline)
          .modifier(FruitHeadline())
        
        // BUTTON: START
        StartButtonView()
      }//: VSTACK
    } //: ZSTACK
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimating = true
      }
    }
    .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors),
                               startPoint: .top, endPoint: .bottom))
    .cornerRadius(20)
    .padding(.horizontal, 20)
  }
}

// MARK - PREVIEW

struct FruitCardView_Previews: PreviewProvider {
  static var previews: some View {
    FruitCardView(fruit: fruitsData[9])
      .previewLayout(.fixed(width: 320, height: 640))
  }
}
