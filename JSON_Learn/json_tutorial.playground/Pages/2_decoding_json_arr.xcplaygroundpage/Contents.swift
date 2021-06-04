///DECODING JSON ARRAY:

import UIKit

let colorsJson = """
[
  {
    "color": "red",
    "value": "f00"
  },
  {
    "color": "green",
    "value": "0f0"
  },
  {
    "color": "blue",
    "value": "00f"
  },
  {
    "color": "cyan",
    "value": "0ff"
  },
  {
    "color": "magenta",
    "value": "f0f"
  },
  {
    "color": "yellow",
    "value": "ff0"
  },
  {
    "color": "black",
    "value": "000"
  }
]
""".data(using: .utf8)!

struct Color: Decodable {
  var color: String
  var value: String
}

let colors = try! JSONDecoder().decode([Color].self, from: colorsJson)

for color in colors {
  print("\(color.color) - \(color.value)")
}


