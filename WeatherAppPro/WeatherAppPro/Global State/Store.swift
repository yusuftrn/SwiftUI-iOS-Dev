//
//  Store.swift
//  WeatherAppPro
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation

class Store: ObservableObject {
  @Published var selectedUnit: TemperatureUnit = .kelvin
  @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
  
  init() {
    selectedUnit = UserDefaults.standard.unit
  }
  
  func addWeather(_ weather: WeatherViewModel) {
    weatherList.append(weather)
  }
}
