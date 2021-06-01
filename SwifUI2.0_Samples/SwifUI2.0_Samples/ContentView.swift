//
//  ContentView.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink("Custom Controllers", destination: TestRating())
        NavigationLink("State Object", destination: CountObjectViewOutside())
        NavigationLink("Text Editor", destination: TextEditorExample())
        NavigationLink("Color and Date Picker", destination: ColorDatePickerExample())
        NavigationLink("Map Control Example", destination: MapViewExample())
        NavigationLink("ProgressBar View", destination: ProgressViewExample())
        NavigationLink("Lazy V Grid Tut", destination: LazyVerticalGrid())
        NavigationLink("@AppStorage", destination: AppStorageTest())
        NavigationLink("Outline Gruop", destination: OutlineGroupExample())
        NavigationLink("Disclosure Group", destination: DisclosureGroupSample())

      }
      .navigationBarTitle("SwiftUI 2.0 Components", displayMode: .inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
