//
//  Coordinator.swift
//  NearMe
//
//  Created by Yusuf Turan on 31.05.2021.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
  var control: MapView
  
  init(_ control: MapView) {
    self.control = control
  }
  
  func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
    if let annotationView = views.first {
      if let annotation = annotationView.annotation {
        if annotation is MKUserLocation {
          let region = MKCoordinateRegion(
            center: annotation.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
          )
          mapView.setRegion(region, animated: true)
        }
      }
    }
  }
  
}
