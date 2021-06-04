/// Decoding arbitary types

import UIKit

// foo -> string
// bar -> can be any data type.

let json = """
{
  "foo": "Hello",
  "bar": 123,

}
""".data(using: .utf8)!

struct AnyDecodable: Decodable {
  let value: Any
  
  init<T>(_ value: T?) {
    self.value = value ?? ()
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let string = try? container.decode(String.self) {
      self.init(string)
    } else if let integer = try? container.decode(Int.self) {
      self.init(integer)
    } else {
      self.init(())
    }
  }
}

let dictionary = try! JSONDecoder().decode([String:AnyDecodable].self, from: json)

print(dictionary["bar"]?.value ?? "Error") // Output: 123
