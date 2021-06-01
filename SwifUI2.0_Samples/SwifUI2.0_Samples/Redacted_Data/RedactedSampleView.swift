//
//  RedactedSampleView.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct RedactedSampleView: View {
  
  @State private var isRedacted: Bool = true
  
  var body: some View {
    VStack {
      Toggle(isOn: $isRedacted) {
        Text("Redacted")
      }
      Spacer()
      Text("Yusuf Tyraen")
      HStack {
        Text("SSN")
        Text("444-5981-24324")
          .redacted(reason: isRedacted ? .placeholder : .init())
      }
      Spacer()
    }
    .padding()
  }
}

struct RedactedSampleView_Previews: PreviewProvider {
  static var previews: some View {
    RedactedSampleView()
  }
}
