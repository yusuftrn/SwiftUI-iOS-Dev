//
//  Array+Extensions.swift
//  GridTutor
//
//  Created by Yusuf Turan on 16.05.2021.
//

import Foundation

extension Array {
  public func chunked(into size: Int) -> [[Element]] {
    return stride(from: 0, through: count, by: size).map {
      Array(self[$0..<Swift.min($0 + size, count)])
    }
  }
}
