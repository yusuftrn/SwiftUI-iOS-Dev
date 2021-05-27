//
//  HideKeyboardExtension.swift
//  Notepad
//
//  Created by Yusuf Turan on 6.05.2021.
//

import SwiftUI

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
