//
//  PlaySound.swift
//  LearnStoryBoard
//
//  Created by Yusuf Turan on 7.05.2021.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Could not find any play the sound file.")
    }
  }
}
