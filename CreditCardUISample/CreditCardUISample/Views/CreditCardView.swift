//
//  CreditCardView.swift
//  CreditCardUISample
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct CreditCardView<Content>: View where Content: View {
  var content: () -> Content
  
  var body: some View {
    content()
  }
}

struct CreditCardFrontView: View {
  
  let name: String
  let expires: String
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(.white)
        Spacer()
        Text("VISA")
          .foregroundColor(.white)
          .font(.system(size: 24))
          .fontWeight(.bold)
        
      }
      .padding()
      Spacer()
      Text("**** **** **** 2864")
        .foregroundColor(.white)
        .font(.system(size: 32))
      Spacer()
      HStack {
        VStack(alignment: .leading) {
          Text("CARD HOLDER")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.gray)
          Text(self.name)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
        Spacer()
        VStack {
          Text("EXPIRES")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.gray)
          Text(self.expires)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
      }
    }
    .padding()
    .frame(width: 300, height: 200)
    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    .cornerRadius(10)
    
  }
}

struct CreditCardBackView: View {
  
  let cvv: String
  
  var body: some View {
    VStack {
     Rectangle()
      .frame(maxWidth: .infinity, maxHeight: 20)
      .padding([.top])
      Spacer()
      HStack {
        Text(self.cvv)
          .foregroundColor(.black)
          .rotation3DEffect(
            .degrees(180),
            axis: (x: 0.0, y: 1.0, z: 0.0)
          )
          .padding(5)
          .frame(width: 100, height: 20)
          .background(Color.white)
        Spacer()
      }
      .padding()
    }
    .frame(width: 300, height: 200)
    .background(LinearGradient(gradient: Gradient(colors: [Color.yellow , Color.blue]), startPoint: .leading, endPoint: .trailing))
    .cornerRadius(10)
  }
}

struct CreditCardView_Previews: PreviewProvider {
  static var previews: some View {
    CreditCardView<CreditCardFrontView>(content: { CreditCardFrontView(name: "Yusuf Tyraen", expires: "05/22") })
  }
}
