//
//  ContentView.swift
//  TodoCoreData
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - PROPERTIES
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @FetchRequest(
    entity: Todo.entity(),
    sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]
  ) var todos: FetchedResults<Todo>
  
  @State private var showingAddTodoView: Bool = false
  @State private var showingSettingView: Bool = false
  
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(self.todos, id: \.self) { todo in
            HStack {
              Text(todo.name!)
              Spacer()
              Text(todo.priority!)
            }
          }
          .onDelete(perform: { indexSet in
            deleteTodo(at: indexSet)
          })
        }
        .navigationBarTitle("TODO")
        .navigationBarItems(
          leading:
            EditButton()
            .font(.title2),
          trailing:
            Button {
              self.showingSettingView.toggle()
            } label: {
              Image(systemName: "paintbrush")
                .imageScale(.large)
            }
            .sheet(isPresented: $showingSettingView) {
              SettingsView()
            }
        )
        
        // MARK: - NO TODO ITEMS
        if todos.count == 0 {
          EmptyListView()
        }
      }
    }
    .sheet(isPresented: $showingAddTodoView) {
      AddTodoView()
        .environment(\.managedObjectContext, self.managedObjectContext)
    }
    .overlay(
      ZStack {
        Button {
          self.showingAddTodoView.toggle()
        } label: {
          Image(systemName: "plus.circle.fill")
            .resizable()
            .scaledToFit()
            .background(Circle().fill(Color("ColorBase")))
            .frame(width: 48, height: 48, alignment: .center)
        }
      }
      .padding(.bottom, 15)
      .padding(.trailing, 15)
      , alignment: .bottomTrailing
    )
  }
  // MARK: - FUNCTIONS
  private func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = todos[index]
      managedObjectContext.delete(todo)
      do {
        try managedObjectContext.save()
      } catch {
        print(error)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
