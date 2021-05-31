//
//  ContentView.swift
//  NearMe
//
//  Created by Yusuf Turan on 31.05.2021.
//

import SwiftUI
import MapKit

struct ContentView: View {
  
  private var locationManager = LocationManager()
  @State private var search: String = ""
  @State private var landmarks = [Landmark]()
  @State private var tapped: Bool = false
  
  var body: some View {
    ZStack(alignment: .top) {
      MapView(landmarks: self.landmarks)
      TextField("Search", text: self.$search, onEditingChanged: { _ in }) {
        self.getNearByLandmarks()
      }.textFieldStyle(RoundedBorderTextFieldStyle())
      .padding()
      .offset(y: 44)
      PlaceListView(landmarks: self.landmarks) {
        self.tapped.toggle()
      }
      .animation(.spring())
      .offset(y: calculateOffset())
    }
  }
  
  private func calculateOffset() -> CGFloat {
    if self.landmarks.count > 0 && !self.tapped {
      return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 3
    } else if self.tapped {
      return 100
    } else {
      return UIScreen.main.bounds.size.height
    }
  }
  
  private func getNearByLandmarks() {
    guard let location = self.locationManager.location else {
      return
    }
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = self.search
    request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    let search = MKLocalSearch(request: request)
    search.start { (response, error) in
      guard let response = response, error == nil else {
        return
      }
      let mapItems = response.mapItems
      self.landmarks = mapItems.map {
        Landmark(placemark: $0.placemark)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

