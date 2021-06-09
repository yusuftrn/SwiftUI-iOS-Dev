//
//  CollectMap.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI
import Combine

struct CollectMap: View {
  
  // MARK: - FUNCTIONS
  func collect() {
    ///Collects values published and makes an array again => Check console for outputs.
    let arr = ["A", "B", "C", "D", "E"].publisher
    
    arr.sink {
      print("Default subscribing")
      print($0)
    }
    arr.collect().sink {
      print("Collect makes an array:")
      print($0)
    }
    arr.collect(2).sink {
      print("Collect makes 2 item array:")
      print($0)
    }
  }
  func mapFunc() {
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    let numbers = [123, 45, 67]
    
    numbers.publisher.map { formatter.string(from: NSNumber(integerLiteral: $0)) ?? "" }.sink{
      print($0)
    }
  }
  
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        collect()
        mapFunc()
      }
  }
}

struct CollectMap_Previews: PreviewProvider {
  static var previews: some View {
    CollectMap()
  }
}
