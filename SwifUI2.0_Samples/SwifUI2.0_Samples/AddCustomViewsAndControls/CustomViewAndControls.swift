//
//  CustomViewAndControls.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct LibraryContent: LibraryContentProvider {
  
  @LibraryContentBuilder
  var views: [LibraryItem] {
    LibraryItem (
      RatingsView(rating: .constant(3)),
      title: "Rating Control",
      category: .control
    )
  }
  
  @LibraryContentBuilder
  func modifiers(base: Image) -> [LibraryItem] {
    LibraryItem(
      base.resizedToFill(width: 150, height: 150),
      title: "Resized To Fill Function",
      category: .layout
    )
  }
}
