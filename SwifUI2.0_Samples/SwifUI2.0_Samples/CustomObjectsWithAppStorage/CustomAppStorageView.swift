//
//  CustomAppStorageView.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct Settings: Codable {
  let darkMode: Bool
  let name: String
}

struct CustomAppStorageView: View {
  
  @AppStorage("settings")
  private var settingsData: Data = Data()
  @State private var output: String = ""
  
  var body: some View {
    VStack {
      Text("Output shows here\n\(output)")
      Divider()
      Button("Load from App Storage") {
        guard let settings = try? JSONDecoder().decode(Settings.self, from: settingsData) else {
          return
        }
        output = "isDarkMode: \(settings.darkMode), name: \(settings.name)"
      }
      Divider()
      Button("Save in App Storage") {
        let settings = Settings(darkMode: true, name: "Yusuf Tyraen")
        
        guard let settingsData = try? JSONEncoder().encode(settings) else {
          return
        }
        self.settingsData = settingsData
      }
      Divider()
    }
  }
}

struct CustomAppStorageView_Previews: PreviewProvider {
  static var previews: some View {
    CustomAppStorageView()
  }
}
