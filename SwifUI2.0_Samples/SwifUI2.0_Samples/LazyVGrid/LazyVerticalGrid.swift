//
//  LazyVerticalGrid.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 31.05.2021.
//

import SwiftUI

struct LazyVerticalGrid: View {
  
  let animals = ["🙉", "🐮", "🐼", "🐻", "🦅", "🐴", "🐔", "🦇", "🐌", "🦒", "🐛"]
  @State private var slideValue: CGFloat = 2
  var body: some View {
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: Int(self.slideValue))
    
    return VStack {
      Slider(value: $slideValue, in: 2...10, step: 1)
      Text(String(format: "%.0f", self.slideValue))
      
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(self.animals, id: \.self) { animal in
            Text(animal)
              .font(.system(size: 100 / slideValue * 3))
          }
        }
      }
    }
    .padding()
  }
}

struct LazyVerticalGrid_Previews: PreviewProvider {
  static var previews: some View {
    LazyVerticalGrid()
  }
}
