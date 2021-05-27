//
//  Constant.swift
//  Notepad
//
//  Created by Yusuf Turan on 6.05.2021.
//

import SwiftUI


// MARK: - FORMATTER
public let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
  return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


// MARK: - UX
let feedback = UINotificationFeedbackGenerator()
