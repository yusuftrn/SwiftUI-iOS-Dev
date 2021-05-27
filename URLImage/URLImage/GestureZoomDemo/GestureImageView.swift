//
//  GestureImageView.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct GestureImageView: View {
  
  @State private var scaleValue: CGFloat = CGFloat(1.0)
  @State private var rotationState: Double = 0.0

  var body: some View {
    VStack {
      Image("cat")
        .resizable()
        .frame(width: 350, height: 500)
        .cornerRadius(15)
        .scaleEffect(self.scaleValue)
        .rotationEffect(Angle(degrees: self.rotationState))
        .animation(.easeInOut(duration: 1))
        .shadow(radius: 10)
        /// Magnification
        .gesture(
          MagnificationGesture()
            .onChanged { value in
              self.scaleValue = value.magnitude
            }
        )
        /// Rotation
        .gesture(
          RotationGesture()
            .onChanged({ value in
              self.rotationState = value.degrees
            })
        )
      
      Text("Zoom In Out")
        .font(.largeTitle)
        .foregroundColor(.white)
    }
    .frame(
      minWidth: 0, maxWidth: .infinity,
      minHeight: 0, maxHeight: .infinity
    )
    .background(Color.orange)
    .cornerRadius(30)
  }
}

struct GestureImageView_Previews: PreviewProvider {
  static var previews: some View {
    GestureImageView()
  }
}
