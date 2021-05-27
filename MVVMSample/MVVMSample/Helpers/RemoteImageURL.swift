//
//  RemoteImageURL.swift
//  MVVMSample
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI


class RemoteImageURL: ObservableObject {
  @Published var data = Data()
  init(imageURL: String) {
    guard let url = URL(string: imageURL) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, err) in
      guard let data = data else { return }
      DispatchQueue.main.async {
        self.data = data
      }
    }
    .resume()
  }
}
