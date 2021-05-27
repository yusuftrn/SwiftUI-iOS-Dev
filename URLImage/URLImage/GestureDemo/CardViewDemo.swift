//
//  CardViewDemo.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct CardViewDemo: View {
  
  @State private var tapped: Bool = false
  @State private var cardDragSate: CGSize = CGSize.zero
  var body: some View {
    CardView(tapped: $tapped)
      .animation(.spring())
      .offset(y: self.cardDragSate.height)
      /// DragGesture follows translation.
      .gesture(DragGesture()
        .onChanged { value in
          self.cardDragSate = value.translation
        }
        .onEnded { value in
          self.cardDragSate = CGSize.zero
        }
      )
      /// TapGesture follows clicks.
      .gesture(
        TapGesture()
          .onEnded({ _ in
            self.tapped.toggle()
          })
      )
    
  }
}

struct CardViewDemo_Previews: PreviewProvider {
  static var previews: some View {
    CardViewDemo()
  }
}
