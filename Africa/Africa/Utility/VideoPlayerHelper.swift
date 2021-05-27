//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
  guard let resource = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
    fatalError("Video file not found.")
  }
  let video = AVPlayer(url: resource)
  video.play()
  return video
}
