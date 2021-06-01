//
//  MapViewExample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 31.05.2021.
//

import SwiftUI
import MapKit

struct MapViewExample: View {

  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530),
    latitudinalMeters: 2000, longitudinalMeters: 2000)
  
  var body: some View {
    VStack {
      Map(coordinateRegion: $region)
    }
  }
}

struct MapViewExample_Previews: PreviewProvider {
  static var previews: some View {
    MapViewExample()
  }
}
