//
//  OutlineGroupExample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI


struct OutlineGroupExample: View {
  var body: some View {
    VStack {
      List {
        ForEach(ListItem.all()) { category in
          Section(header: EmptyView()) {
            OutlineGroup(category, children: \.items) { item in
              Text(item.name)
            }
          }
        }
      }
      Text("Outline Group View recursively goes deep same Structure view.\nSo the subitem must be same item type of root.")
    }
  }
}

struct OutlineGroupExample_Previews: PreviewProvider {
  static var previews: some View {
    OutlineGroupExample()
  }
}
