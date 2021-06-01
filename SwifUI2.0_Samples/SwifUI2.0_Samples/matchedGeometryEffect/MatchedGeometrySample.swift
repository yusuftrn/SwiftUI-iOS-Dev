//
//  MatchedGeometrySample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct MatchedGeometrySample: View {
  
  @State private var isSwitched: Bool = false
  @Namespace private var ns
  var body: some View {
    HStack {
      if !isSwitched {
        Circle()
          .fill(Color.red)
          .frame(width: 50, height: 50)
          .matchedGeometryEffect(id: "animation", in: ns)
      }
      
      Spacer()
      
      Button("Switch") {
        withAnimation {
          self.isSwitched.toggle()
        }
      }
      Spacer()
      
      if isSwitched {
        Circle()
          .fill(Color.green)
          .matchedGeometryEffect(id: "animation", in: ns)
      }
    }
    .padding()
  }
}

struct MatchedGeometrySample_Previews: PreviewProvider {
  static var previews: some View {
    MatchedGeometrySample()
  }
}
