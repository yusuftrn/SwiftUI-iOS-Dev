//
//  ReportModel.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI


struct Report: Hashable {
  let year: String
  let revenue: Double
}

extension Report {
  static func all() -> [Report] {
    return [
      Report(year: "2001", revenue: 2500),
      Report(year: "2002", revenue: 4500),
      Report(year: "2003", revenue: 8500)
    ]
  }
}
