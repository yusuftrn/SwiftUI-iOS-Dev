//
//  ColorDatePickerExample.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct ColorDatePickerExample: View {
  @State private var color: Color = Color.white
  @State private var selectedDate = Date()
  
  var body: some View {
    VStack {
      ColorPicker("Select a color", selection: self.$color)
        .padding()
      
      Text("This text's color will change after every pick")
        .padding()
        .font(.largeTitle)
        .foregroundColor(color)
        .background(Color.gray)
      
      Divider()
      
      DatePicker("Select a date", selection: self.$selectedDate)
        .padding()
    }
  }
}

struct ColorDatePickerExample_Previews: PreviewProvider {
  static var previews: some View {
    ColorDatePickerExample()
  }
}
