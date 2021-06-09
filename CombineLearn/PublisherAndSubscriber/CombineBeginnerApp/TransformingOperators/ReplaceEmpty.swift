//
//  ReplaceEmpty.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI
import Combine

struct ReplaceEmpty: View {
  func emptyPublish() {
    let empty = Empty<Int, Never>()
    let subs = empty.sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
    subs.cancel()
  }
  func replaceEmpty() {
    let empty = Empty<Int, Never>()
    let subs = empty
      .replaceEmpty(with: 1) //what you want
      .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
    subs.cancel()
  }
  var body: some View {
    Text("Hello, World!")
      .onAppear() {
        emptyPublish()
        replaceEmpty()
      }
  }
}

struct ReplaceEmpty_Previews: PreviewProvider {
  static var previews: some View {
    ReplaceEmpty()
  }
}
