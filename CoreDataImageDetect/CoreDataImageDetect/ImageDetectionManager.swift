//
//  ImageDetectionManager.swift
//  CoreDataImageDetect
//
//  Created by Yusuf Turan on 18.05.2021.
//

import Foundation
import CoreML
import UIKit

class ImageDetectionManager {
    let model = Resnet50()
    
    func detect(_ img: UIImage) -> String? {
        guard let pixelBuffer = img.toCVPixelBuffer(),
            let prediction = try? model.prediction(image: pixelBuffer) else {
                return nil
        }
        return prediction.classLabel
    }
    
}
