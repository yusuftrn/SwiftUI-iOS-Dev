//
//  URLImageView.swift
//  SwifUISamples
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct URLImageView: View {
  
  let url: String
  let placeholder: String
  
  @ObservedObject var imageLoader = ImageLoader()
  
  init(url: String, placeholder: String = "placeholder") {
    self.url = url
    self.placeholder = placeholder
    self.imageLoader.downloadImage(url: self.url)
  }
  
  var body: some View {
    
    if let data = self.imageLoader.downloadedData {
      return Image(uiImage: UIImage(data: data)!).resizable()
    } else {
      return Image("placeholder").resizable()
    }
    
  }
}

struct URLImageView_Previews: PreviewProvider {
  static var previews: some View {
    URLImageView(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
  }
}
