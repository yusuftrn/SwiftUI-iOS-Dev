/// Implement Custom encoding format

import UIKit

typealias Temperature = Double

extension Temperature {
  func toCelcius() -> Temperature {
    return (self - 32 * 5/9) + 32
  }
  func toFahrenheit() -> Temperature {
    return (self * 9/5)
  }
}

private enum TemperatureEncodingStrategy {
  case fahrenheit
  case celcius
}

extension CodingUserInfoKey {
  static let temperatureEncodingStrategy = CodingUserInfoKey.init(rawValue: "temperatureEncodingStrategy")!
}

struct Thermostate: Encodable {
  var readings: [Temperature]
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()

    switch encoder.userInfo[CodingUserInfoKey.temperatureEncodingStrategy] as? TemperatureEncodingStrategy {
    case .celcius?:
      try container.encode(self.readings.map { $0.toCelcius() })
      
    case .fahrenheit?:
      try container.encode(self.readings.map { $0.toFahrenheit() })
    default:
      try container.encode(self.readings.map { $0.toCelcius() })
    }
  }
}

let readings = [12.34, 23.45, 56.77]

let encoder = JSONEncoder()
encoder.userInfo[CodingUserInfoKey.temperatureEncodingStrategy] = TemperatureEncodingStrategy.celcius

let thermostate = Thermostate(readings: readings)
let data = try! encoder.encode(thermostate)

print(String(data: data, encoding: .utf8)!)
