//
//  AppStorageTest.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct AppStorageTest: View {
  
  //Store data in user-defaults with "isDarkMode" key.
  @AppStorage("isDarkMode")
  private var isDarkMode: Bool = false
  
  var body: some View {
    VStack {
      Text(isDarkMode ? "DARK" : "LIGHT")
      Toggle(isOn: $isDarkMode) {
        Text("Select View Mode")
      }
      .fixedSize()
    }
  }
}

struct AppStorageTest_Previews: PreviewProvider {
  static var previews: some View {
    AppStorageTest()
  }
}
