//
//  ContentView.swift
//  NotesForWatch WatchKit Extension
//
//  Created by Yusuf Turan on 7.06.2021.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
  @AppStorage("lineCount") var lineCount: Int = 1
  // MARK: - FUNCTION
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  func save() {
    do {
      let dataEncoded = try JSONEncoder().encode(notes)
      let url = getDocumentDirectory().appendingPathComponent("notes")
      try dataEncoded.write(to: url)
    } catch {
      print("Saving data has failed!")
    }
  }
  func load() {
    DispatchQueue.main.async {
      do {
        let url = getDocumentDirectory().appendingPathComponent("notes")
        let data = try Data(contentsOf: url)
        notes = try JSONDecoder().decode([Note].self, from: data)
      } catch {
        // pass
      }
    }
  }
  func deleteNote(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      save()
    }
  }
  
  // MARK: - BODY
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 6) {
        TextField("Add New Note", text: $text)
        Button {
          guard text.isEmpty == false else { return }
          let note = Note(id: UUID(), text: text)
          notes.append(note)
          text = ""
          save()
        } label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 42, weight: .semibold))
        }
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.accentColor)
      }
      Spacer()
      if notes.count >= 1 {
        List {
          ForEach(0..<notes.count, id: \.self){ i in
            NavigationLink(
              destination: DetailView(note: notes[i], count: notes.count, index: i)) {
              HStack {
                Capsule()
                  .frame(width: 4)
                  .foregroundColor(.accentColor)
                Text(notes[i].text)
                  .lineLimit(lineCount)
                  .padding(.leading, 5)
              }
            }
          }
          .onDelete(perform: deleteNote)
        }
      } else {
        Spacer()
        Image(systemName: "note.text")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray)
          .opacity(0.25)
          .padding(25)
        Spacer()
      }
    }
    .navigationTitle("Notes")
    .onAppear(perform: {
      load()
    })
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
