//
//  TimerApp.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct TimerApp: View {
  
  @ObservedObject var fancyTimer = FancyTimer()
  
  var body: some View {
    Text("\(self.fancyTimer.value)")
      .font(.system(size:100, design: .rounded))
      .foregroundColor(.red)
  }
}

struct TimerApp_Previews: PreviewProvider {
  static var previews: some View {
    TimerApp()
  }
}
