//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
  let id: String
  let name: String
  let image: String
  var latitude: Double
  var longitude: Double

  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: latitude,
      longitude: longitude)
  }
}
