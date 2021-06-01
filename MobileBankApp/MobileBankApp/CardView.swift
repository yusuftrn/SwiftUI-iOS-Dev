//
//  CardView.swift
//  MobileBankApp
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct Card: View {
  
  let title: String
  let lastFour: String
  let amount: String
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        VStack(alignment: .leading) {
          Text(title)
            .foregroundColor(Color.white)
          Text("**** \(lastFour)")
            .foregroundColor(Color.white)
        }.padding()
        Spacer()
        Text(amount).padding()
          .foregroundColor(Color.white)
          .font(.largeTitle)
      }
      
      HStack {
        HStack(spacing: -10) {
          Image("face")
            .resizable()
            .frame(width: 44, height: 44)
          
          Image("face")
            .resizable()
            .frame(width: 44, height: 44)
          
          Image(systemName: "plus.circle")
            .foregroundColor(.white)
            .opacity(0.5)
            .font(.system(size: 35))
        }
        
        Spacer()
        Text("Visa").padding()
          .font(.largeTitle)
          .foregroundColor(.white)
      }
    }
  }
}

struct Card_Previews: PreviewProvider {
  static var previews: some View {
    Card(title: "Private card", lastFour: "3456", amount: "$10,456")
  }
}



