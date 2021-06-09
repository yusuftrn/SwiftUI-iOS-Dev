//
//  ContentView.swift
//  PublisherAndSubscriber
//
//  Created by Yusuf Turan on 9.06.2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        List {
          Section(header: Text("Basic")) {
            NavigationLink( destination: SendNotification(), label: { Text("Send Notification") })
            NavigationLink( destination: ImlementSubscriber(), label: { Text("Implement Subscriber") })
            NavigationLink( destination: Subjects(), label: { Text("Subjects Subscriber") })
          }
          Section(header: Text("Transform Operators")) {
            NavigationLink( destination: CollectMap(), label: { Text("collect - map") })
            NavigationLink( destination: MapKeyPath(), label: { Text("map KeyPath - replace nil") })
            NavigationLink( destination: ReplaceEmpty(), label: { Text("Replace Empty") })
            NavigationLink( destination: ScanOperator(), label: { Text("Scan Operator") })
          }
          Section(header: Text("Filtering Operators")) {
            NavigationLink( destination: CollectMap(), label: { Text("collect - map") })
          }
        }
        .navigationBarTitle("Combine & Funcional Programming", displayMode: .inline)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
