//
//  LegacyGrid.swift
//  GridTutor
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct LegacyGrid: View {
  
  let dishes: [Dish] = Dish.all()
  
  var body: some View {
    VStack {
      let chunkedDishes = dishes.chunks(size: 3)
      List {
        ForEach(0..<chunkedDishes.count) { index in
          HStack {
            ForEach(chunkedDishes[index]) { dish in
              Text(dish.image)
                .font(.system(size: CGFloat(100)))
            }
          }
        }
      }
    }
    .padding()
  }
}

struct LegacyGrid_Previews: PreviewProvider {
  static var previews: some View {
    LegacyGrid()
  }
}
