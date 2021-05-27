//
//  CategoryModel.swift
//  TouchDown
//
//  Created by Yusuf Turan on 4.05.2021.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
}
