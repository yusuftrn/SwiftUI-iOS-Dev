//
//  InfoView.swift
//  SwipeIt
//
//  Created by Yusuf Turan on 15.05.2021.
//

import SwiftUI

struct InfoView: View {
  // MARK: - PROPERTIES
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        Spacer()
        Text("App Info")
          .fontWeight(.black)
          .modifier(TitleModifier())
        AppInfoView()
        Text("Credits")
          .fontWeight(.black)
          .modifier(TitleModifier())
        CreditsView()
        Spacer(minLength: 10)
        Button {
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Continue".uppercased())
            .modifier(ButtonModifier())
        }
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .padding(.top, 15)
    .padding(.bottom, 25)
    .padding(.horizontal, 25)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}

struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(itemOne: "Application", itemTwo: "SwipeIt")
      RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone & iPad")
      RowAppInfoView(itemOne: "Developer", itemTwo: "Joshua")
    }
  }
}

struct RowAppInfoView: View {
  // MARK: - PROPERTIES
  var itemOne: String
  var itemTwo: String
  
  var body: some View {
    VStack {
      HStack {
        Text(itemOne)
          .foregroundColor(.gray)
        Spacer()
        Text(itemTwo)
      }
      Divider()
    }
  }
}

struct CreditsView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("Photos from")
          .foregroundColor(.gray)
        Spacer()
        Text("Unsplash")
      }
      Divider()
      Text("Photographers")
        .foregroundColor(.gray)
      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        .multilineTextAlignment(.leading)
        .font(.footnote)
    }
  }
}
