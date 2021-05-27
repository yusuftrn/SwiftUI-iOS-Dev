//
//  ContentView.swift
//  FormsAndModals
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var showModal: Bool = false
  @State private var selectedFlag: String = ""
  @State private var country: String = ""
  
  let flags = ["🇩🇿", "🏳️‍🌈", "🇦🇿", "🇺🇳", "🇧🇪", "🇧🇮"]
  @State private var flagVM: FlagViewModel = FlagViewModel()
  
  var body: some View {
    List {
      Text(self.flagVM.country)
      ForEach(self.flags, id: \.self) { flag in
        HStack {
          Text(flag)
            .font(.system(size: 100))
          Spacer()
        }
        .onTapGesture {
          self.flagVM.flag = flag
          self.flagVM.showModal.toggle()
        }
      }
    }.sheet(isPresented: self.$flagVM.showModal) {
      FlagDetailView(flagVM: $flagVM)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
