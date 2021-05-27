//
// Created by Yusuf Turan on 22.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String

  var thumbnail: String {
    "video-\(id)"
  }
}
