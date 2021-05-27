//
//  ContentView.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct StateFilter: View {
  
  var model: [Dish] = Dish.all()
  @State private var isSpicy: Bool = false
  
  var body: some View {
    List {
      Toggle(isOn: $isSpicy) {
        Text("Spicy")
          .font(.title)
      }
      ForEach(model.filter { $0.isSpicy == self.isSpicy}) { dish in
        HStack {
          Text(dish.imageURL)
            .font(.system(size: 100))
          Text(dish.name)
            .font(.title)
            .lineLimit(nil)
          Spacer()
          
          if dish.isSpicy {
            Text("🌶")
              .font(.system(size: 35))
          }
          
        }
      }
      
    }
  }
}

struct StateFilter_Previews: PreviewProvider {
  static var previews: some View {
    StateFilter()
  }
}
