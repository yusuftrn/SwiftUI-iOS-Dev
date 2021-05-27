//
//  SettingsView.swift
//  TodoCoreData
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  @Environment(\.presentationMode) var presentationMode
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack(alignment: .center, spacing: 0) {
        /// MARK: - FORM
        Form {
          /// MARK: - section3
          Section(header: Text("Follow us on social media")) {
            FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://www.google.com")
            FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://www.twitter.com")
            FormRowLinkView(icon: "play.rectangle", color: Color.red, text: "Youtube", link: "https://www.youtube.com")
          }
          /// MARK: - section4
          Section(header: Text("About the application")) {
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "TODO")
            FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone & iPad")
            FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Josh")
            FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Joshua")
            FormRowStaticView(icon: "flag", firstText: "Version", secondText: "0.0.0.0.1 - alpha")
          }
          .padding(.vertical, 3)
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        /// MARK: - FOOTER
        Text("Copyright (c) All right reserved.\nBetter Apps ❤️ Less Code.")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .foregroundColor(Color.secondary)
      }
      .navigationBarItems(
        trailing:
          Button {
            self.presentationMode.wrappedValue.dismiss()
          } label: {
            Image(systemName: "xmark")
          }         
      )
      .navigationBarTitle("Settings", displayMode: .inline)
      .background(Color("ColorBackground")).edgesIgnoringSafeArea(.all)
    }
  }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
