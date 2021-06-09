//
//  ImlementSubscriber.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI
import Combine

class StringSubscriber: Subscriber {
  typealias Input = String
  typealias Failure = Never
  
  func receive(subscription: Subscription) {
    print("Received Subscription")
    subscription.request(.max(3)) //backpressure: Max request count
  }
  
  func receive(_ input: Input) -> Subscribers.Demand {
    print("Received value: \(input)")
    return .none // if we use return .unlimited -> then it receive all published value + completion
  }
  
  func receive(completion: Subscribers.Completion<Failure>) {
    print("Completed subscription")
  }
}

struct ImlementSubscriber: View {
  
  func implementationFunc() {
    let publisher = ["A", "B", "C", "D", "E", "F", "G"].publisher
    let subscriber = StringSubscriber()
    publisher.subscribe(subscriber)
  }
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        implementationFunc()
      }
  }
}

struct ImlementSubscriber_Previews: PreviewProvider {
  static var previews: some View {
    ImlementSubscriber()
  }
}
