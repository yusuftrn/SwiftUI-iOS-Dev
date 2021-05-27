//
//  StateBindingConceptsApp.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

@main
struct StateBindingConceptsApp: App {
  var body: some Scene {
    WindowGroup {
      UserView()
        .environmentObject(UserSettings())
    }
  }
}
