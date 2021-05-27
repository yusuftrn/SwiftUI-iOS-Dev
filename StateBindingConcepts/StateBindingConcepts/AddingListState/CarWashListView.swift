//
//  List.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct CarWashListView: View {
  
  @State var tasks = [Task]()
  
  private func addTask() {
    self.tasks.append(Task(name: "Wash the car"))
  }
  
  var body: some View {
    VStack {
      Button {
        addTask()
      } label: {
        Text("Add Task")
      }
      List {
        ForEach(tasks) { task in
          Text(task.name)
        }
      }
    }
  }
}

struct CarWashListView_Previews: PreviewProvider {
  static var previews: some View {
    CarWashListView()
  }
}
