//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by Yusuf Turan on 1.05.2021.
//

import SwiftUI

@main
struct TouchDownApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(Shop())
    }
  }
}
