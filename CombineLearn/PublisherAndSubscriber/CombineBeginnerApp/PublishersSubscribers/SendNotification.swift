//
//  SendNotification.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI

/// Publisher and Subscriber connection test with Notification Sample

struct SendNotification: View {
  
  func sendNotification() {
    let notification = Notification.Name("My Notification")
    let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
    let subscription = publisher.sink { _ in
      print("Notification received!")
    }
    
    NotificationCenter.default.post(name: notification, object: nil) // fired 1 times.
    subscription.cancel() // Cancel the subscription
    NotificationCenter.default.post(name: notification, object: nil) // cant fire.
  }
  
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        sendNotification()
      }
  }
}

struct SendNotification_Previews: PreviewProvider {
  static var previews: some View {
    SendNotification()
  }
}
