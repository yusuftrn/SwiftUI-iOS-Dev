//
//  GroupDataInListView.swift
//  SwifUISamples
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct GroupDataInListView: View {
  
  private var groceryCategories = GroceryCategory.all()
  var body: some View {
    List {
      ForEach(self.groceryCategories, id: \.title) { gc in
        Section(header: Text(gc.title).font(.title)) {
          ForEach(gc.groceryItems, id: \.title) { gi in
            Text(gi.title)
          }
        }
      }
    }.listStyle(GroupedListStyle())
  }
}
struct GroupDataInListView_Previews: PreviewProvider {
  static var previews: some View {
    GroupDataInListView()
  }
}
