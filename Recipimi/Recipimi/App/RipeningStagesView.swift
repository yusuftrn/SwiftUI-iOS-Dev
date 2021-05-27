//
//  RipeningStagesView.swift
//  Recipimi
//
//  Created by Yusuf Turan on 8.05.2021.
//

import SwiftUI

struct RipeningStagesView: View {
  
  var ripeninStages: [Ripening] = ripeningData
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack {
        Spacer()
        HStack(alignment: .center, spacing: 25) {
          ForEach(ripeninStages) { item in
            RipeningView(ripening: item)
          }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct RipeningStagesView_Previews: PreviewProvider {
  static var previews: some View {
    RipeningStagesView(ripeninStages: ripeningData)
  }
}
