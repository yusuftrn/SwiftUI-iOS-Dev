//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation

class WeatherService {
  func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
    guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appID)") else {
      completion(nil)
      return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
      if let weatherResponse = weatherResponse {
        let weather = weatherResponse.main
        completion(weather)
      } else {
        completion(nil)
      }
    }.resume()
  }
}

/// Dont forget to add your appID from openweathermap.
/// Dont forget to add network requests at info.plist: App Transport Security Settings -> Allow Arbitrary Loads = YES
