//
//  ContentView.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct BasicState: View {
  
  @State var name: String = "John"
  
  var body: some View {
    VStack {
      Text(name)
        .font(.system(.title2, design: .rounded))
        .padding()
      
      Button {
        name = "Yusuf"
      } label: {
        Text("Change Name")
          .foregroundColor(.white)
          .font(.title3)
          .padding(10)
          .background(Color.pink)
          .clipShape(RoundedRectangle(cornerRadius: 15))
      }
    }
  }
}

struct BasicState_Previews: PreviewProvider {
  static var previews: some View {
    BasicState()
  }
}
