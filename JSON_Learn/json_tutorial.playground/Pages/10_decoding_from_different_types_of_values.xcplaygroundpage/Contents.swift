/// Decoding from different types of values

import UIKit

let payload1 = """
{
 "coordinates":
  [
    {
      "latitude": 37.232,
      "longitude": -112.12
    }
  ]
}
""".data(using: .utf8)!

let payload2 = """
{
 "coordinates": [
    [37.232,-112.12]
  ]
}
""".data(using: .utf8)!

let payload3 = """
{
 "coordinates": [
    "37.232,-112.12"
  ]
}
""".data(using: .utf8)!

struct Place: Decodable {
  var latitude: Double
  var longitude: Double
  
  private enum CodingKeys: String, CodingKey {
    case latitude = "latitude"
    case longitude = "longitude"
  }
  
  init(from decoder: Decoder) throws {
    //container for playload1
    if let container = try? decoder.container(keyedBy: CodingKeys.self) {
      self.latitude = try container.decode(Double.self, forKey: .latitude)
      self.longitude = try container.decode(Double.self, forKey: .longitude)
      
      //container for payload2
    } else if var container = try? decoder.unkeyedContainer(){
      self.latitude = try container.decode(Double.self)
      self.longitude = try container.decode(Double.self)
      
      //container for payload3
    } else if let container = try? decoder.singleValueContainer() {
      let string = try container.decode(String.self)
      let values = string.components(separatedBy: ",")
      guard values.count == 2, let latitude = Double(values[0]), let longitude = Double(values[1]) else {
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode coordinates.")
      }
      self.latitude = latitude
      self.longitude = longitude
      
      // unable to recognize
    } else {
      let context = DecodingError.Context.init(codingPath: decoder.codingPath, debugDescription: "Unable to decode coordinates.")
      throw DecodingError.dataCorrupted(context)
    }
  }
}


let placesDict1 = try! JSONDecoder().decode([String: [Place]].self, from: payload1)
if let places = placesDict1["coordinates"] {
  places[0].latitude
  places[0].longitude
}

let placesDict2 = try! JSONDecoder().decode([String: [Place]].self, from: payload2)
if let places2 = placesDict2["coordinates"] {
  places2[0].latitude
  places2[0].longitude
}

let placesDict3 = try! JSONDecoder().decode([String: [Place]].self, from: payload3)
if let places3 = placesDict2["coordinates"] {
  places3[0].latitude
  places3[0].longitude
}
