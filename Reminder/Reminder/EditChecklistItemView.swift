//
// Created by Yusuf Turan on 12.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct EditChecklistItemView: View {
  
  @Binding var checklistItem: ChecklistItem
  
  var body: some View {
    Form {
      TextField("Name", text: $checklistItem.name)
      Toggle("is Completed", isOn: $checklistItem.isChecked)
    }
  }
}

struct EditChecklistItemView_Previews: PreviewProvider {
  static var previews: some View {
    EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
  }
}
