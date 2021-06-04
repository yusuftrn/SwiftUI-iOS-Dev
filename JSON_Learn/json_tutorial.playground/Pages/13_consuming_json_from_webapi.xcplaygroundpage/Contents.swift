/// Consuming JSON Web API.

import UIKit
import PlaygroundSupport

struct User: Decodable {
  let id: Int
  let name: String
  let username: String
  let email: String
  let address: Address
}

struct Address: Decodable {
  let street: String
  let city: String
  let zipcode: String
  let geo: Geo
}

struct Geo: Decodable {
  let latitude: String
  let longitude: String
  
  private enum CodingKeys: String, CodingKey {
    case latitude = "lat"
    case longitude = "lng"
  }
}

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
URLSession.shared.dataTask(with: url) { data, response, err in
  guard err == nil, let data = data else {
    print(err!)
    return
  }
  let userData = try? JSONDecoder().decode([User].self, from: data)
  if let userData = userData {
    for user in userData {
      print("\(user.name) - \(user.email) -  \(user.address.city) - Geo: \(user.address.geo.latitude) - \(user.address.geo.longitude)")
    }
  }
}.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
