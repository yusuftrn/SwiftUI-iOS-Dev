//
//  MVVMUSer.swift
//  MVVMSample
//
//  Created by Yusuf Turan on 14.05.2021.
//

import SwiftUI

struct MVVMUser: Identifiable, Decodable {
  var id = UUID()
  let uid: Int
  let firstName: String
  let lastName: String
  let email: String
  let avatarURL: String
}
