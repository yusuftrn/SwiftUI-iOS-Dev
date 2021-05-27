//
//  NightShift.swift
//  FormsAndModals
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct NightShift: View {
  
  @State private var scheduled: Bool = false
  @State private var manuallyEnableUntilTomorrow: Bool = false
  @State private var colorTemperature: CGFloat = 0.5
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Header Text").padding(5)) {
          Toggle(isOn: $scheduled) {
            Text("Scheduled")
          }
          HStack {
            VStack(alignment: .leading) {
              Text("From")
              Text("To")
            }
            Spacer()
            NavigationLink(destination: Text("Scheduled Settings")) {
              VStack(alignment: .leading) {
                Text("Sunset")
                  .foregroundColor(.blue)
                Text("Sunrise")
                  .foregroundColor(.blue)
              }
            }
            .fixedSize()
          }
        }
        
        Section {
          Toggle(isOn: $manuallyEnableUntilTomorrow) {
            Text("Manually Enable Untill Tomorrow")
          }
        }
        
        Section(header: Text("Color Temparature").padding(5)) {
          HStack {
            Text("Less Warm")
            Slider(value: $colorTemperature)
            Text("More Warm")
          }
        }
      }
    }
  }
}

struct NightShift_Previews: PreviewProvider {
  static var previews: some View {
    NightShift()
  }
}
