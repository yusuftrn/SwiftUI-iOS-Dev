import UIKit

let json =
"""
{
    "customers":
    [
        {
            "firstName" : "John",
            "lastName" : "Doe",
            "dateCreated": "05/09/1998",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                },
                "addressType": "condo"
            }
        }
    ]
}
""".data(using: .utf8)!

//enum
enum AddressType: String, Decodable {
  case apartment = "apartment"
  case house = "house"
  case condo = "condo"
  case townHouse = "townHouse"
}

struct Geo: Decodable {
  var latitude: Double
  var longitude: Double
}

struct Address: Decodable {
  var street: String
  var city: String
  var state: String
  var geo: Geo
  var addressType: AddressType
}

struct Customer: Decodable {
  var firstName: String
  var lastName: String
  var address: Address
  var dateCreated: Date
}

struct CustomersResponse: Decodable {
  var customers: [Customer]
}

//custom date formatter.
extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yy"
    return formatter
  }()
}


let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

let customerResponse = try! decoder.decode(CustomersResponse.self, from: json)

print("\(customerResponse.customers[0].firstName) - \(customerResponse.customers[0].dateCreated)")
