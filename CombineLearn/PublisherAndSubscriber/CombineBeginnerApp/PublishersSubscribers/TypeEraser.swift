//
//  TypeEraser.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI
import Combine

struct TypeEraser: View {
  
  func typeEraserFunc() {
    ///Client or some-oneelse cant see our publisher decleration with quick-help:
    ///Declaration seems like => let publisher1: PassthroughSubject<Int, Never>
    let publisher1 = PassthroughSubject<Int, Never>()
    publisher1.send(5)
    /// Now we add the eraseToAnyPublisher() method our publisher. Quickhelp shows:
    ///Declaration => let publisher2: AnyPublisher<Int, Never>
    let publisher2 = PassthroughSubject<Int, Never>().eraseToAnyPublisher()
    // publisher2.send(5) *-> not work!
  }

  var body: some View {
    Text("Hello, World!")
  }
  
}

struct TypeEraser_Previews: PreviewProvider {
  static var previews: some View {
    TypeEraser()
  }
}
