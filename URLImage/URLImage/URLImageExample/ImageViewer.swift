//
//  ImageViewer.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct ImageViewer: View {
  let url: String
  let placeHolder: String
  @ObservedObject var imageLoader = ImageLoader()
  
  init(url: String, placeHolder: String = "placeholder") {
    self.url = url
    self.placeHolder = placeHolder
    self.imageLoader.downloadImage(url: self.url)
  }
  var body: some View {
    if let data = self.imageLoader.downloadedData {
      return Image(uiImage: UIImage(data: data)!)
    } else {
      return Image(systemName: "photo.on.rectangle.angled")
    }
  }
}

struct ImageViewer_Previews: PreviewProvider {
  static var previews: some View {
    ImageViewer(url: "https://randomuser.me/api/portraits/men/81.jpg")
  }
}
