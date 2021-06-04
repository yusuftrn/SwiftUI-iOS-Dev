import UIKit

///Basic Decode & Encode Data

///DECODE EXAMPLE:

// JSON Sample
print("---- DECODE EXAMPLE ----")

let json = """
  {
    "firstName": "John",
    "lastName": "Doe",
    "age": 34
  }
  """.data(using: .utf8)!

struct Customer: Decodable {
  var firstName: String
  var lastName: String
  var age: Int

//  Decodable protocol makes auto all this match (if they have same data)
//  private enum CodingKeys: String, CodingKey {
//    case firstName
//    case lastName
//    case age
//  }
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.firstName = try container.decode(String.self, forKey: .firstName)
//    self.lastName = try container.decode(String.self, forKey: .lastName)
//    self.age = try container.decode(Int.self, forKey: .age)
//  }
}

let customer = try! JSONDecoder().decode(Customer.self, from: json)

print(customer)
print("\n")

///ENCODE EXAMPLE:
print("---- ENCODE EXAMPLE ----")

struct CustomerEncode: Codable {
  var firstName: String
  var lastName: String
  var age: Int

//  Codable protocol makes auto all this match (if they have same data)
//  private enum CodingKeys: String, CodingKey {
//    case firstName
//    case lastName
//    case age
//  }
//
//  func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//    try container.encode(self.firstName, forKey: .firstName)
//    try container.encode(self.lastName, forKey: .lastName)
//    try container.encode(self.age, forKey: .age)
//  }
}

let customer2 = CustomerEncode(firstName: "Josh", lastName: "Tyraen", age: 22)
let encodedCustomerJSON = try! JSONEncoder().encode(customer2)
print(encodedCustomerJSON)
print(String(data: encodedCustomerJSON, encoding: .utf8)!)
