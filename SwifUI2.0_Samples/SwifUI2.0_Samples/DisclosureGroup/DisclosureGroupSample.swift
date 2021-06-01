//
//  DisclosureGroupSample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct DisclosureGroupSample: View {
  @State private var carsExpanded: Bool = true
  @State private var fruitsExpanded: Bool = false
  let carsList = ["🚗", "🚕", "🚙", "🚌", "🏎"]
  let fruitsList = ["🍑", "🍉", "🍌"]
  
  var body: some View {
    Form {
      DisclosureGroup(
        isExpanded: $carsExpanded,
        content: {
          HStack {
            ForEach(carsList, id: \.self) { car in
              Text(car)
                .font(.system(size: 50))
            }
          }
        },
        label: { Text("Cars") }
      )
      DisclosureGroup(
        isExpanded: $fruitsExpanded,
        content: {
          VStack(alignment: .center) {
            List(fruitsList, id: \.self) { fruit in
              Text(fruit)
                .font(.system(size: 50))
            }
          }
        },
        label: { Text("Fruits") }
      )
    }
  }
}

struct DisclosureGroupSample_Previews: PreviewProvider {
  static var previews: some View {
    DisclosureGroupSample()
  }
}
