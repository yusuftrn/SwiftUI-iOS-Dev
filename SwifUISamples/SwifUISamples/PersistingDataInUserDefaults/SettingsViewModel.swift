//
//  SettingsViewModel.swift
//  SwifUISamples
//
//  Created by Yusuf Turan on 18.05.2021.
//

import Foundation

class SettingsViewModel: ObservableObject {
  @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
    didSet {
      UserDefaults.standard.set(self.isOn, forKey: "isOn")
    }
  }
}
