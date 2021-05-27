//
//  ContentView.swift
//  ToDoApp
//
//  Created by Yusuf Turan on 13.05.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - PROPERTIES
  @Environment(\.managedObjectContext) var managedObjectContext
  @State private var showingAddTodoView: Bool = false
  // MARK: - BODY
  var body: some View {
    NavigationView {
      List(0..<5) { _ in
        Text("Hello, world")
      }
      .navigationBarTitle("ToDo", displayMode: .inline)
      .navigationBarItems(trailing:
                            Button {
                              self.showingAddTodoView.toggle()
                            } label: {
                              Image(systemName: "plus")
                            }
                            .sheet(isPresented: $showingAddTodoView) {
                              AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                            }
      )
    }
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
