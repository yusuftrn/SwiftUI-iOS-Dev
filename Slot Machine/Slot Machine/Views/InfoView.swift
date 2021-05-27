//
//  InfoView.swift
//  Slot Machine
//
//  Created by Yusuf Turan on 10.05.2021.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      LogoView()
      Spacer()
      Form {
        Section(header: Text("About the application")) {
          FormRowView(firstItem: "Application", secondItem: "Slot Machine")
          FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
          FormRowView(firstItem: "Developer", secondItem: "Joshua")
          FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
          FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass")
          FormRowView(firstItem: "Copyright", secondItem: "© All rights reserved.")
          FormRowView(firstItem: "Version", secondItem: "0.0.0.1 - α")
        }
      }
      .font(.system(.body, design: .rounded))
    }
    .padding(.top, 40)
    .overlay(
      Button {
        audioPlayer?.stop()
        self.presentationMode.wrappedValue.dismiss()
      } label: {
        Image(systemName: "xmark.circle")
          .font(.title)
      }
      .padding(.top, 30)
      .padding(.trailing, 20)
      .accentColor(Color.secondary),
      alignment: .topTrailing
    )
    .onAppear(perform: {
      playSound(sound: "background-music", type: "mp3")
    })
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
