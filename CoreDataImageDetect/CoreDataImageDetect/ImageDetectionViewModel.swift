//
//  ImageDetectionViewModel.swift
//  CoreDataImageDetect
//
//  Created by Yusuf Turan on 18.05.2021.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject {
  
  var name: String = ""
  var manager: ImageDetectionManager
  
  @Published var predictionLabel: String = ""
  
  init(manager: ImageDetectionManager) {
    self.manager = manager
  }
  
  func detect(_ name: String) {
    
    let sourceImage = UIImage(named: name)
    
    guard let resizedImage = sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else {
      fatalError("Unable to resizing")
    }
    
    if let label = self.manager.detect(resizedImage) {
      self.predictionLabel = label
    }
  }
}
