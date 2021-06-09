//
//  MapKeyPath.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI
import Combine

struct Point {
  let x: Int
  let y: Int
}

struct MapKeyPath: View {
  func mapKeyPath() {
    let publisher = PassthroughSubject<Point, Never>()
    let subscription = publisher.map(\.x, \.y).sink { x, y in
      print("x is \(x) and y is \(y)")
    }
    publisher.send(Point(x: 2, y: 10))
    subscription.cancel()
  }
  func replaceNil() {
    let arr = ["A", "B", nil, "C"].publisher
    let subs = arr.replaceNil(with: "*").sink {
      print($0 as Any)
    }
    subs.cancel()
  }
  func replaceNilUnwrapped() {
    let arr = ["A", "B", nil, "C"].publisher
    let subs = arr
      .replaceNil(with: "*")
      .map{ $0! }
      .sink {
        print($0)
      }
    
    subs.cancel()
  }
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        mapKeyPath()
        replaceNil()
        replaceNilUnwrapped()
      }
  }
}

struct MapKeyPath_Previews: PreviewProvider {
  static var previews: some View {
    MapKeyPath()
  }
}
