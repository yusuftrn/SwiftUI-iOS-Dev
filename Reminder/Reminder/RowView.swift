//
// Created by Yusuf Turan on 12.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct RowView: View {
  
  @Binding var checklistItem: ChecklistItem
  
  var body: some View {
    NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
      HStack {
        Text(checklistItem.name)
        Spacer()
        Text(checklistItem.isChecked ? "🏆" : "💪🏼")
      }
    }
  }
}

struct RowView_Previews: PreviewProvider {
  static var previews: some View {
    RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
  }
}
