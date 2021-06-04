///Decoding Key-Value Using Response Model

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

struct PlacesResponse: Decodable {
  var places: [Place]
}

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


let placesResponse = try! JSONDecoder().decode(PlacesResponse.self, from: jsonData)

print(placesResponse.places[0])
print(placesResponse.places[1])
