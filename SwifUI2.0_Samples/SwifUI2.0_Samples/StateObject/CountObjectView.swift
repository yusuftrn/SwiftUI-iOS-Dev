//
//  CountObjectView.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct CountObjectView: View {
  @StateObject var counter = Counter()
  var body: some View {
    VStack {
      Text("INSIDE VIEW [STATE OBJECT]")
      Text("\(counter.value)")
      Divider()
      Button("[+] CountObjectView view Increment") {
        counter.value += 1
      }
    }
    .padding()
    .background(Color.yellow)
  }
}

struct CountObjectViewOutside: View {
  @State private var count: Int = 0
  var body: some View {
    VStack {
      Text("OUTSIDE VIEW [LOCAL]")
      Text("\(count)")
      Divider()
      Button("[+] CountObjectViewOutside Increment") {
        count += 1
      }
      CountObjectView()
    }
    .padding()
    .background(Color.green)
  }
}


struct CountObjectViewOutside_Previews: PreviewProvider {
  static var previews: some View {
    CountObjectViewOutside()
  }
}
