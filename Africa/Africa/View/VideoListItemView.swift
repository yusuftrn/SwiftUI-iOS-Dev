//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct VideoListItemView: View {
  // MARK: - PROPERTIES
  let video: Video

  // MARK: - BODY
  var body: some View {
    HStack(spacing: 10) {
      ZStack {
        Image(video.thumbnail)
          .resizable()
          .scaledToFit()
          .frame(height: 80)
          .cornerRadius(9)

        Image(systemName: "play.circle")
          .resizable()
          .scaledToFit()
          .frame(height: 32)
          .shadow(radius: 4)
      }
      VStack(alignment: .leading, spacing: 10) {
        Text(video.name)
          .font(.title2)
          .fontWeight(.heavy)
          .foregroundColor(.accentColor)

        Text(video.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
      }
    }
  }
}

// MARK: - PREVIEW
struct VideoListItemView_Previews: PreviewProvider {
  static let videos: [Video] = Bundle.main.decode("videos.json")
  static var previews: some View {
    VideoListItemView(video: videos[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
