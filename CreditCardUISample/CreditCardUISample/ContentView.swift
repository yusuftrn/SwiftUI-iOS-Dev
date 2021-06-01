//
//  ContentView.swift
//  CreditCardUISample
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var degrees: Double = 0
  @State private var flipped: Bool = false
  
  @State private var name: String = ""
  @State private var expires: String = ""
  @State private var cvv: String = ""
  
  var body: some View {
    VStack {
      CreditCardView {
        VStack {
          Group {
            if flipped {
              CreditCardBackView(cvv: self.cvv)
            } else {
              CreditCardFrontView(name: self.name, expires: self.expires)
            }
          }
        }
        .rotation3DEffect(
          .degrees(degrees),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
      }
      .onTapGesture {
        withAnimation {
          degrees += 180
          flipped.toggle()
        }
      }
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding([.top, .leading, .trailing])
      TextField("Expiration", text: $expires)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding([.top, .leading, .trailing])
      TextField("CVV", text: $cvv) { editingChanged in
        withAnimation {
          degrees += 180
          flipped.toggle()
        }
      } onCommit: {}
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding([.top, .leading, .trailing])
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
