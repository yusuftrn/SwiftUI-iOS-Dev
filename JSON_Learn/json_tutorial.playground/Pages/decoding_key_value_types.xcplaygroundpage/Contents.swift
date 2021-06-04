/// Decoding Basic Key-Value Types

import UIKit

let jsonData =
"""
{
  "places": [
    {
      "name": "Costa Rica",
      "latitude": "34.56",
      "longitude": "65.67"
    },
    {
      "name": "Boston",
      "latitude": "134.56",
      "longitude": "265.67"
    }
  ]
}
""".data(using: .utf8)!

struct Place: Decodable {
  var name: String
  var latitude: String
  var longitude: String
}
extension Place: CustomStringConvertible {
  public var description: String {
    return "Name: \(self.name) | Lat: \(self.latitude) - Long: \(self.longitude)\n"
  }
}


let placesDictionary = try! JSONDecoder().decode([String: [Place]].self, from: jsonData)
let places = placesDictionary["places"]
print(places!)

