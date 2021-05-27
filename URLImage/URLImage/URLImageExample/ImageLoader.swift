//
//  ImageLoader.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import Foundation

class ImageLoader: ObservableObject {
  @Published var downloadedData: Data?
  func downloadImage(url: String) {
    guard let imageURL = URL(string: url) else {
      fatalError("Invalid URL.")
    }
    URLSession.shared.dataTask(with: imageURL) { data, _, err in
      guard let data = data, err == nil else {
        return
      }
      DispatchQueue.main.async {
        self.downloadedData = data
      }
    }.resume()
  }
}
