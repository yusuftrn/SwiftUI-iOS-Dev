//
//  ProgressViewExample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 31.05.2021.
//

import SwiftUI

struct ProgressViewExample: View {
  
  @State private var downloaded: Float = 0
  
  var body: some View {
    VStack {
      ProgressView("Loading", value: self.downloaded, total: 100)
      Button("Download") {
        self.startDownload()
      }
    }
    .padding()
  }
  
  private func startDownload() {
    let timer = Timer(timeInterval: 0.1, repeats: true) { timer in
      if self.downloaded <= 100 {
        self.downloaded += 2
      } else {
        timer.invalidate()
      }
    }
    RunLoop.main.add(timer, forMode: .common)
  }
}

struct ProgressViewExample_Previews: PreviewProvider {
  static var previews: some View {
    ProgressViewExample()
  }
}
