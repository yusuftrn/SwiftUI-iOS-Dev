//
//  TextEditorExample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct TextEditorExample: View {
  
  @State private var description: String = ""
  
  var body: some View {
    VStack {
      Text("Write something below")
      TextEditor(text: $description)
        .frame(height: 400)
        .padding()
        .shadow(radius: 2)
    }
  }
}

struct TextEditorExample_Previews: PreviewProvider {
  static var previews: some View {
    TextEditorExample()
  }
}
