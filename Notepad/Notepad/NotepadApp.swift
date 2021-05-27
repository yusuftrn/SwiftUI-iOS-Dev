//
//  NotepadApp.swift
//  Notepad
//
//  Created by Yusuf Turan on 6.05.2021.
//

import SwiftUI

@main
struct NotepadApp: App {
  let persistenceController = PersistenceController.shared
  @AppStorage("isDarkMode") var isDarkMode: Bool = false
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
  }
}
