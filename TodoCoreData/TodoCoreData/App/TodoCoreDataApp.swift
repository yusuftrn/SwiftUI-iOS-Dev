//
//  TodoCoreDataApp.swift
//  TodoCoreData
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI

@main
struct TodoCoreDataApp: App {
  
  let context = PersistentCloudKitContainer.persistentContainer.viewContext
  @Environment(\.scenePhase) var scenePhase
  
  var body: some Scene {
    WindowGroup {
      ContentView().environment(\.managedObjectContext, context)
    }
    .onChange(of: scenePhase) { (newScenePhase) in
      switch newScenePhase {
      case .background:
        print("Scene is background.")
        try? context.save()
      case .active:
        print("Scene is active.")
      case .inactive:
        print("Scene is inactive.")
      @unknown default:
        print("Apple must have changed something")
      }
    }
  }
}
