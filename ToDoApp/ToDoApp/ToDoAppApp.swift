//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Yusuf Turan on 13.05.2021.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
