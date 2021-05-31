//
//  LandmarkAnnotation.swift
//  NearMe
//
//  Created by Yusuf Turan on 31.05.2021.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(landmark: Landmark) {
    self.title = landmark.name
    self.coordinate = landmark.coordinate
  }
}
