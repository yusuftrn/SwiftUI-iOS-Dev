//
//  SettingsView.swift
//  Recipimi
//
//  Created by Yusuf Turan on 8.05.2021.
//

import SwiftUI

struct SettingsView: View {
  
  // MARK: - PROPERTIES
  @State private var enableNotification: Bool = true
  @State private var backgroundRefresh: Bool = false
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      // MARK: - HEADER
      VStack(alignment: .center, spacing: 5) {
        Image("avocado")
          .resizable()
          .scaledToFit()
          .padding(.top)
          .frame(width: 100, height: 100, alignment: .center)
          .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
        
        Text("Avocados".uppercased())
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorGreenAdaptive"))
      }
      .padding()
      
      // MARK: - FORM
      Form {
        // MARK: - SECTION #1
        Section(header: Text("General Settings")) {
          Toggle(isOn: $enableNotification) {
            Text("Enable notification")
          }
          
          Toggle(isOn: $backgroundRefresh) {
            Text("Background refresh")
          }
        }
        
        // MARK: - SECTION #2
        Section(header: Text("Application")) {
          if enableNotification {
            HStack {
              Text("Product")
                .foregroundColor(.gray)
              Spacer()
              Text("Recipimi")
            }
            HStack {
              Text("Compatibility")
                .foregroundColor(.gray)
              Spacer()
              Text("iPhone & iPad")
            }
            HStack {
              Text("Developer")
                .foregroundColor(.gray)
              Spacer()
              Text("Joseph")
            }
            HStack {
              Text("Designer")
                .foregroundColor(.gray)
              Spacer()
              Text("MasterClass Tutor")
            }
            HStack {
              Text("Version")
                .foregroundColor(.gray)
              Spacer()
              Text("0.0.0.0.1 - α")
            }
          } else {
            HStack {
              Text("Personal message")
                .foregroundColor(.gray)
              Spacer()
              Text("🏆 Congrats.")
            }
          }
          
        }
      }
    }
    .frame(maxWidth: 640)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
