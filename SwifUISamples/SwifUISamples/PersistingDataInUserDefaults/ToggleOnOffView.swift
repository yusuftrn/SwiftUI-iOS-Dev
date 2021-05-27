//
//  ToggleOnOffView.swift
//  SwifUISamples
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct ToggleOnOffView: View {
  
  @ObservedObject var settingsVM = SettingsViewModel()
  var body: some View {
    VStack(alignment: .center) {
      Toggle(isOn: self.$settingsVM.isOn) {
        Text("")
      }.fixedSize()
    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(self.$settingsVM.isOn.wrappedValue ? Color.green : Color.red)
  }
}

struct ToggleOnOffView_Previews: PreviewProvider {
  static var previews: some View {
    ToggleOnOffView()
  }
}
