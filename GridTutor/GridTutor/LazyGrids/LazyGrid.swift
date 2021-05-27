//
//  LazyGrid.swift
//  GridTutor
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct LazyGrid: View {
  private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
  
  private var colors: [Color] = [.yellow, .purple, .green]
  
  private var gridItemLayout = [GridItem(.fixed(70)), GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    VStack {
      ScrollView(.horizontal) {
          LazyHGrid(rows: gridItemLayout, spacing: 20) {
              ForEach((0...9999), id: \.self) {
                  Image(systemName: symbols[$0 % symbols.count])
                      .font(.system(size: 30))
                      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                      .background(colors[$0 % colors.count])
                      .cornerRadius(10)
              }
          }
      }
      ScrollView {
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
          ForEach((0...9999), id: \.self) {
            Image(systemName: symbols[$0 % symbols.count])
              .font(.system(size: 30))
              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
              .background(colors[$0 % colors.count])
              .cornerRadius(10)
          }
        }
        .padding()
      }
    }
  }
}

struct LazyGrid_Previews: PreviewProvider {
  static var previews: some View {
    LazyGrid()
  }
}
