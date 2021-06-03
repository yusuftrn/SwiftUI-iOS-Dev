//
//  LocationManager.swift
//  NearMe
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
  private let locationManager = CLLocationManager()
  @Published var location: CLLocation? = nil
  override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.distanceFilter = kCLDistanceFilterNone
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  func startUpdates() {
    locationManager.startUpdatingLocation()
  }
  func stopUpdates() {
    locationManager.stopUpdatingLocation()
  }
}
extension LocationManager: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    DispatchQueue.main.async {
      self.location = location
    }
  }
}
