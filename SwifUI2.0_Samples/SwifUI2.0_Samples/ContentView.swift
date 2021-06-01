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
        Group {
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
        Group {
          NavigationLink("Foreground Operation Example", destination: ForegroundOperations())
          NavigationLink("Custom Objects With AppStorage", destination: CustomAppStorageView())
          NavigationLink("Matched Geometry Effect", destination: MatchedGeometrySample())
          NavigationLink("MusicPlayer Matched Geo Effect", destination: MusicPlayerMatchedGeometry())
          NavigationLink("Redacted Data", destination: RedactedSampleView())
        }
      }
      .navigationBarTitle("SwiftUI 2.0 Components", displayMode: .inline)
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
