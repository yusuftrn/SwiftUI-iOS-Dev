//
//  LandmarkViewModel.swift
//  NearMe
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation
import MapKit

struct LandmarkViewModel: Identifiable {
  let placemark: MKPlacemark
  let id = UUID()
  var name: String {
    placemark.name ?? ""
  }
  var title: String {
    placemark.title ?? ""
  }
  var coordinate: CLLocationCoordinate2D {
    placemark.coordinate
  }
}
