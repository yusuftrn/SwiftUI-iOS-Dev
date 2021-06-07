//
//  DetailView.swift
//  NotesForWatch WatchKit Extension
//
//  Created by Yusuf Turan on 7.06.2021.
//

import SwiftUI

struct DetailView: View {
  let note: Note
  let count: Int
  let index: Int
  @State private var isCreditsPresented: Bool = false
  @State private var isSettingsPresented: Bool = false
  var body: some View {
    VStack(alignment: .center, spacing: 3) {
      HeaderView()
      /// Content
      Spacer()
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      /// Footer
      HStack {
        Image(systemName: "gear")
          .imageScale(.large)
          .onTapGesture {
            isSettingsPresented.toggle()
          }
          .sheet(isPresented: $isSettingsPresented, content: {
            SettingsView()
          })
        Spacer()
        Text("\(count) / \(index+1)")
        Spacer()
        Image(systemName: "info.circle")
          .imageScale(.large)
          .onTapGesture {
            isCreditsPresented.toggle()
          }
          .sheet(isPresented: $isCreditsPresented, content: {
            CreditsView()
          })
      }
      .foregroundColor(.secondary)
    }
    .padding(3)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var sampleData: Note = Note(id: UUID(), text: "Sample text")
  static var previews: some View {
    DetailView(note: sampleData, count: 5, index: 1)
  }
}
