//
//  WeatherAppProApp.swift
//  WeatherAppPro
//
//  Created by Yusuf Turan on 3.06.2021.
//

import SwiftUI

@main
struct WeatherAppProApp: App {
  var body: some Scene {
    WindowGroup {
      WeatherListScreen()
        .environmentObject(Store())
    }
  }
}
