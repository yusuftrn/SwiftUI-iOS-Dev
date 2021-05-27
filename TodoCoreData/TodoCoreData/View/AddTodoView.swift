//
//  AddTodoView.swift
//  TodoCoreData
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - PROPERTIES
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  @State private var name: String = ""
  @State private var priority: String = "Normal"
  @State private var errowShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  let priorities = ["High", "Normal", "Low"]
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        VStack(alignment:.leading, spacing: 20) {
          // MARK: - Todo Name
          TextField("Todo", text: $name)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            .font(.system(size: 24, weight: .bold, design: .default))
          // MARK: - Todo Priority
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
          // MARK: - Save Button
          Button {
            if self.name != "" {
              let todo = Todo(context: self.managedObjectContext)
              todo.name = self.name
              todo.priority = self.priority
              do {
                try self.managedObjectContext.save()
              } catch {
                print(error)
              }
            } else {
              self.errowShowing = true
              self.errorTitle = "Invalid Name"
              self.errorMessage = "Make sure to enter something for\nthe new todo item."
              return
            }
            self.presentationMode.wrappedValue.dismiss()
          } label: {
            Text("Save")
              .font(.system(size: 24, weight: .bold, design: .default))
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(Color.blue)
              .cornerRadius(9)
              .foregroundColor(Color.white)
          }
        }
        .padding(.horizontal)
        .padding(.vertical, 30)
        Spacer()
      }
      .navigationBarTitle("New Todo", displayMode: .inline)
      .navigationBarItems(
        trailing:
          Button {
            self.presentationMode.wrappedValue.dismiss()
          } label: {
            Image(systemName: "xmark")
          }
      )
      .alert(isPresented: $errowShowing) {
        Alert(
          title: Text(errorTitle),
          message: Text(errorMessage),
          dismissButton: .default(Text("OK"))
        )
      }
    }
  }
}

struct AddTodoView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoView()
  }
}
