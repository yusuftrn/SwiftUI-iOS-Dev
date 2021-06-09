//
//  ScanOperator.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI

struct ScanOperator: View {
  
  func scan() {
    let publisher = (1...10).publisher
    let subs = publisher.scan([]) { numbers, value -> [Int] in
      numbers + [value]
    }.sink {
      print($0)
    }
    
    subs.cancel()
  }
  
  var body: some View {
    Text("Hello, World!")
      .onAppear() {
        scan()
      }
  }
}

struct ScanOperator_Previews: PreviewProvider {
  static var previews: some View {
    ScanOperator()
  }
}
