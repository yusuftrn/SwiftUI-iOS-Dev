//
//  AddTodoView.swift
//  ToDoApp
//
//  Created by Yusuf Turan on 13.05.2021.
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - PROPERTIES
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  @State private var name: String = ""
  @State private var priority: String = "Normal"
  let priorities = ["High", "Normal", "Low"]
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        Form {
          // MARK: - Todo Name
          TextField("Todo", text: $name)
          // MARK: - Todo Priority
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          // MARK: - Save Button
          Button {
            let todo = Todo(context: self.managedObjectContext)
          } label: {
            Text("Save")
          }
        }
        Spacer()
      }
      .navigationBarTitle("New Todo", displayMode: .inline)
      .navigationBarItems(trailing:
                            Button {
                              self.presentationMode.wrappedValue.dismiss()
                            } label: {
                              Image(systemName: "xmark")
                            }
      )
    }
  }
}

// MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoView()
  }
}
