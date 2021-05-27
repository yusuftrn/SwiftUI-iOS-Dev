//
//  BindingView.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct BindingView: View {
  
  let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2019")
  
  @State private var isPlaying: Bool = false
  
  var body: some View {
    VStack {
      Text(self.isPlaying ? self.episode.name+(" 🎉") : self.episode.name)
        .font(.title)
        .foregroundColor(self.isPlaying ? Color.green : Color.black)
      Text(self.episode.track)
        .foregroundColor(.secondary)
        .padding()
      
      PlayButton(isPlaying: $isPlaying)
    }
  }
}

struct PlayButton: View {
  @Binding var isPlaying: Bool
  var body: some View {
    Button {
      self.isPlaying.toggle()
    } label: {
      Text(self.isPlaying ? "Stop ⏯" : "Play ▶️")
        .foregroundColor(.white)
        .padding(.horizontal, 50)
        .padding(.vertical, 10)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
  }
}

struct BindingView_Previews: PreviewProvider {
  static var previews: some View {
    BindingView()
  }
}
