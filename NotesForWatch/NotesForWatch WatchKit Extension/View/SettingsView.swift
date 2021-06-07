//
//  SettingsView.swift
//  NotesForWatch WatchKit Extension
//
//  Created by Yusuf Turan on 7.06.2021.
//

import SwiftUI

struct SettingsView: View {
  @AppStorage("lineCount") var lineCount: Int = 1
  @State private var value: Float = 1.0
  
  func updateValue() {
    lineCount = Int(value)
  }
  
  var body: some View {
    VStack(spacing: 8) {
      HeaderView(title: "Settings")
      Text("Lines: \(lineCount)".uppercased())
        .fontWeight(.bold)
      Slider(
        value: Binding(
          get: {
            self.value
          },
          set: { (newValue) in
            self.value = newValue
            self.updateValue()
          }),
        in: 1...4, step: 1
      )
        .foregroundColor(.accentColor)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
