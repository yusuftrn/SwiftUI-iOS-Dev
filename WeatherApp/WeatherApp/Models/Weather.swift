//
//  Model.swift
//  WeatherApp
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation

struct WeatherResponse: Decodable {
  let main: Weather
}

struct Weather: Decodable {
  var temp: Double?
  var humidity: Double?
}
