import UIKit

let json =
"""
{
    "customers":
    [
        {
            "firstName" : "John",
            "lastName" : "Doe",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                }
            }
        }
    ]
}
""".data(using: .utf8)!

struct Geo: Decodable {
  var latitude: Double
  var longitude: Double
}

struct Address: Decodable {
  var street: String
  var city: String
  var state: String
  var geo: Geo
}

struct Customer: Decodable {
  var firstName: String
  var lastName: String
  var address: Address
}

struct CustomersResponse: Decodable {
  var customers: [Customer]
}

let customersResponse = try! JSONDecoder().decode(CustomersResponse.self, from: json)

print(customersResponse)
print(customersResponse.customers[0].address.geo.latitude)
