//
//  MKCoordinateRegion+Extensions.swift
//  NearMe
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
  static var defaultRegion: MKCoordinateRegion {
    return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8866384973, longitude: 29.2624538821), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
  }
}
