//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> [T] {
    // Locate the json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }

    // Create a property for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from file.")
    }

    // Create a decoder
    let decoder = JSONDecoder()

    // Create a property for the decoded data
    guard let loadedData = try? decoder.decode([T].self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }

    // return data
    return loadedData
  }
}
