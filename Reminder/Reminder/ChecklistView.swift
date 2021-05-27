//
// Created by Yusuf Turan on 10.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI



struct ChecklistView: View {
  //Properties
  @ObservedObject var checklist = Checklist()
  @State var newChecklistItemIsVisible = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(checklist.items) { index in
          RowView(checklistItem: self.$checklist.items[index])
        }
        .onDelete(perform: checklist.deleteListItem)
        .onMove(perform: checklist.moveListItem)
      }
      .navigationBarItems(
        leading: Button(action: { self.newChecklistItemIsVisible = true}) {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("Add item")
          }
        },
        trailing: EditButton()
      )
      .navigationBarTitle("Reminder", displayMode: .inline)
      .onAppear() {
        //self.checklist.printChecklistContents()
        self.checklist.saveListItems() //save
      }
    }
    .sheet(isPresented: $newChecklistItemIsVisible) {
      NewChecklistItemView(checklist: self.checklist)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ChecklistView()
  }
}
