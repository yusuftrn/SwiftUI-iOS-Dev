//
//  MusicPlayerView.swift
//  NeuomorhicDesignSample
//
//  Created by Yusuf Turan on 31.05.2021.
//

import SwiftUI

struct MusicPlayerView: View {

  @State private var sliderValue: Double = 0.5
  
  var grayColor: Color {
    return Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
  }
  
  var whiteColor: Color {
    return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
  }
  
  var body: some View {
    VStack {
      HStack {
        NeumorphicImageButton(systemName: "arrow.left", size: CGSize(width: 20, height: 20)) {
        }
        .foregroundColor(Color.black)
        Spacer()
        Text("Playing Now..")
        Spacer()
        NeumorphicImageButton(systemName: "line.horizontal.3", size: CGSize(width: 20, height: 20)) {
        }
        .foregroundColor(Color.black)
      }
      .padding()
      Spacer()
      ZStack {
        Image("art")
          .resizable()
          .frame(width: 300, height: 300)
          .clipShape(Circle())
          .padding()
          .shadow(color: grayColor, radius: 8, x: 9, y: 9)
          .shadow(color: whiteColor, radius: 8, x: -9, y: -9)
      }
      .clipShape(Circle().inset(by: 6))
      .shadow(color: grayColor, radius: 8, x: 9, y: 9)
      .shadow(color: whiteColor, radius: 8, x: -9, y: -9)
      Spacer()
      Slider(value: self.$sliderValue, in: 0...1, step: 0.1)
        .shadow(color: grayColor, radius: 8, x: 9, y: 9)
        .shadow(color: whiteColor, radius: 8, x: -9, y: -9)
        .padding()
      Spacer()
      HStack {
        NeumorphicImageButton(systemName: "backward.fill", size: CGSize(width: 25, height: 25)) {
        }
        .foregroundColor(Color.black)
        Spacer()
        NeumorphicImageButton(systemName: "stop.fill", size: CGSize(width: 25, height: 25)) {
        }
        .foregroundColor(Color.black)
        Spacer()
        NeumorphicImageButton(systemName: "forward.fill", size: CGSize(width: 25, height: 25)) {
        }
        .foregroundColor(Color.black)
      }
      .padding()
    }
  }
}

struct MusicPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    MusicPlayerView()
  }
}
