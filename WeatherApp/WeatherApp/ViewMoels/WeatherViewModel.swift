//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
  private var weatherService: WeatherService!
  
  @Published var weather = Weather()
  
  var cityName: String = ""
  
  let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 2
    return numberFormatter
  }()
  
  var temperature: String {
    if let temp = self.weather.temp {
      return String(format: "%.0f", temp)
    } else {
      return ""
    }
  }
  
  var humidty: String {
    if let humidity = self.weather.humidity {
      return String(format: "%.0f", humidity)
    } else {
      return ""
    }
  }
  
  func search() {
    if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
      fetchWeather(by: city)
    }
  }
  
  init() {
    self.weatherService = WeatherService()
  }
  
  private func fetchWeather(by city: String) {
    self.weatherService.getWeather(city: city) { weather in
      if let weather = weather {
        DispatchQueue.main.async {
          let kelvin = Measurement<UnitTemperature>(value: Double(weather.temp!), unit: .kelvin)
          let celciusValue = kelvin.converted(to: .celsius)
          let formattedCelciusValue = self.numberFormatter.string(from: NSNumber(value: celciusValue.value))
          self.weather = weather
          self.weather.temp = Double(formattedCelciusValue!)
        }
      }
    }
  }
}
