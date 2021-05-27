//
//  UserSettings.swift
//  StateBindingConcepts
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {
  @Published var score: Int = 0
}
