/// Handling property name mismatches

import UIKit

let json = """
{
  "first_name": "Josh",
  "last_name":  "Doe",
  "age": 34
}
""".data(using: .utf8)!

// JSON Data and our model property names cant match.

struct Customer: Decodable {
  var firstName: String
  var lastName: String
  var age: Int
}

/*
 let customer = try! JSONDecoder().decode(Customer.self, from: json)
//Error: "No value associated with key CodingKeys....."
 */

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase //solution for snakecase
let customer = try! decoder.decode(Customer.self, from: json)
print(customer)

///If vendor json is weird like bottom, we have to map data.

let jsonWeird = """
{
  "FIRSTNAME": "Josh",
  "lastname":  "Doe",
  "user_Age": 34,
  "ADDRESS": {
    "Street": "1200 Richmond Ave",
    "State_Short": "TX",
    "ZIPCODE": "77042"
  }
}
""".data(using: .utf8)!

struct Address: Decodable {
  var street: String
  var state: String
  var zipcode: String
  
  private enum CodingKeys: String, CodingKey {
    case street = "Street"
    case state = "State_Short"
    case zipcode = "ZIPCODE"
  }
}

struct CustomerHandleWeirdJson: Decodable {
  var firstName: String
  var lastName: String
  var age: Int
  var address: Address?
  
  public enum CodingKeys: String, CodingKey {
    case firstName = "FIRSTNAME"
    case lastName = "lastname"
    case age = "user_Age"
    case address = "ADDRESS"
  }
}

let decoderWeirdData = JSONDecoder()
let customerWeirdData = try! decoderWeirdData.decode(CustomerHandleWeirdJson.self, from: jsonWeird)
print("\(customerWeirdData.firstName) - \(customerWeirdData.lastName)")
print(customerWeirdData.address!)
