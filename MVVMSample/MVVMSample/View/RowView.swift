//
//  RowVİew.swift
//  MVVMSample
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI

struct RowView: View {
  
  var user: MVVMUser
  @ObservedObject var remoteImageURL: RemoteImageURL
  
  init(user: MVVMUser) {
    self.user = user
    remoteImageURL = RemoteImageURL(imageURL: user.avatarURL)
  }
  
  var body: some View {
    return GeometryReader { geometry in
      VStack {
        Spacer()
        Image(
          uiImage: (
            (self.remoteImageURL.data.isEmpty) ?
              UIImage(named: "Placeholder") : UIImage(data: self.remoteImageURL.data)
          )!
        )
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 150, height: 150)
        
        Text("\(self.user.firstName) \(self.user.lastName)")
        Text("\(self.user.email)")
        Divider()
          .padding(.vertical, 12)
      }
      .frame(width: geometry.size.width, height: geometry.size.height)
      
    }
  }
}

struct RowView_Previews: PreviewProvider {
  static var previews: some View {
    RowView(user: MVVMUser(uid: 0, firstName: "Alex", lastName: "Nagy", email: "alex@nomail.com", avatarURL:"https://robohash.org/7NL.png?size=150x150"))
  }
}
