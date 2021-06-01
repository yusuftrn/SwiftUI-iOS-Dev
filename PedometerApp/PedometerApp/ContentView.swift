//
//  ContentView.swift
//  PedometerApp
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI
import CoreMotion

/*
 1. CMPedometer only works with real devices. Use your iPhone for test.
 2. CMPedometer uses user privacy.
    Add "Privacy - Motion Usage Description" to your info.plist
 */
struct ContentView: View {
  
  // MARK: - PROPERTIES
  @AppStorage("stepCount", store: UserDefaults(suiteName: "group.josh.pedometerApp"))
  var stepCount: Int = 0
  
  @State private var steps: Int?
  @State private var distance: Double?
  private var pedometer: CMPedometer = CMPedometer()
  private var isPedometerAvailable: Bool {
    return
      CMPedometer.isPedometerEventTrackingAvailable() &&
      CMPedometer.isDistanceAvailable() &&
      CMPedometer.isStepCountingAvailable()
  }
  
  // MARK: - FUNCTIONS
  private func updateUI(data: CMPedometerData) {

    stepCount = data.numberOfSteps.intValue
    steps = data.numberOfSteps.intValue
    guard let pedometerDistance = data.distance else { return }
    let distanceInMeters = Measurement(value: pedometerDistance.doubleValue, unit: UnitLength.meters)
    distance = distanceInMeters.converted(to: .kilometers).value
  }
  
  func iniatializePedometer() {
    if isPedometerAvailable {
      guard let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else {
        return
      }
      pedometer.queryPedometerData(from: startDate, to: Date()) { (data, err) in
        guard let data = data, err == nil else {
          return
        }
        updateUI(data: data)
      }
    }
  }
  
  // MARK: - BODY
  var body: some View {
    VStack {
      Text(steps != nil ? "\(steps!) steps" : "")
      Text(distance != nil ? String(format: "%.2f km", distance!) : "")
        .onAppear {
          iniatializePedometer()
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
