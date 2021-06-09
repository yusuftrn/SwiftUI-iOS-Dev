//
//  Subjects.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI
import Combine

/// Subjects are publisher and also subscribers.

enum MyError: Error {
  case subscribeError
}

class StringSub: Subscriber {
  typealias Input = String
  typealias Failure = MyError
  
  func receive(subscription: Subscription) {
    subscription.request(.max(2))
  }
  
  func receive(_ input: Input) -> Subscribers.Demand {
    print(input)
    return .max(1)
  }
  
  func receive(completion: Subscribers.Completion<MyError>) {
    print("Completion")
  }
}

struct Subjects: View {
  
  func stringSubSample() {
    let subscriber = StringSub()
    let subject = PassthroughSubject<String, MyError>()
    
    subject.subscribe(subscriber)
    
    let subscription = subject.sink(receiveCompletion: { completion in
      print("Received Completion from sink")
    }) { value in
      print("Received \(value) from sink.")
    }
    
    subject.send("A")
    subject.send("B")
    subscription.cancel()
    subject.send("C") //cant send because .max(2) Demand default value for StringSub subscription
    subject.send("D") //cant send because .max(2) Demand default value for StringSub subscription
  }
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        stringSubSample()
      }
  }
}

struct Subjects_Previews: PreviewProvider {
  static var previews: some View {
    Subjects()
  }
}
