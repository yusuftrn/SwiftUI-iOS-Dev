//
//  AddWeatherViewModel.swift
//  WeatherAppPro
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
  var city: String = ""
  
  func save(completion: @escaping (WeatherViewModel) -> Void) {
    Webservice().getWeatherByCity(city: city) { (result) in
      switch result {
      case .success(let weather):
        DispatchQueue.main.async {
          completion(WeatherViewModel(weather: weather))
        }
      case .failure(let err):
        print(err)
      }
    }
  }
}
