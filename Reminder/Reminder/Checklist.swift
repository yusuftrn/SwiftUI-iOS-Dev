//
// Created by Yusuf Turan on 12.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

class Checklist: ObservableObject {
  
  @Published var items: [ChecklistItem] = []
  
  init() {
    //print("Documents directory is: \(documentsDirectory())")
    //print("Data file path is: \(dataFilePath())")
    loadListItems()
  }
  
  func printChecklistContents() {
    for item in items {
      print(item)
    }
  }
  
  func deleteListItem(whichElement: IndexSet) {
    items.remove(atOffsets: whichElement)
    //printChecklistContents()
    saveListItems()
  }
  
  func moveListItem(whichElement: IndexSet, destination: Int) {
    items.move(fromOffsets: whichElement, toOffset: destination)
    //printChecklistContents()
    saveListItems()
  }
  
  func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  func dataFilePath() -> URL {
    documentsDirectory().appendingPathComponent("Reminder.plist")
  }
  
  func saveListItems() {
    let encoder = PropertyListEncoder()
    do {
      let data = try encoder.encode(items)
      try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
    } catch {
      print("Error encoding iem arr: \(error.localizedDescription)")
    }
  }
  
  func loadListItems() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
      let decoder = PropertyListDecoder()
      do {
        items = try decoder.decode([ChecklistItem].self, from: data)
      } catch {
        print("Error decoding item arr: \(error.localizedDescription)")
      }
    }
  }
}
