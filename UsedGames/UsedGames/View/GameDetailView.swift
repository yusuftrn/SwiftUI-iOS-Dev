//
// Created by Yusuf Turan on 20.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI
import Combine

struct GameDetailView: View {

  var game: Game
  var gameStore: GameStore

  @State var name: String = ""
  @State var price: Double = 0.0
  @State var shouldEnableSaveButton: Bool = true
  @State var isPhotoPickerPresenting: Bool = false
  @State var isPhotoPickerActionSheetPresenting: Bool = false
  @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
  @State var selectedPhoto: UIImage?

  func validate() {
    shouldEnableSaveButton = game.name != name || game.priceInDollars != price
  }

  func createActionSheet() -> ActionSheet {
    var buttons: [ActionSheet.Button] = [
      .cancel()
    ]

    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      buttons.append(.default(Text("Camera"), action: {
        sourceType = .camera
        isPhotoPickerPresenting = true

      }))
    }

    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      buttons.append(.default(Text("Photo Library"), action: {
        sourceType = .photoLibrary
        isPhotoPickerPresenting = true
      }))
    }
    return ActionSheet(title: Text("Please select a source"), message: nil, buttons: buttons)
  }

  var body: some View {
    Form {
      Section {
        VStack(alignment: .leading, spacing: 6.0) {
          Text("Name")
            .font(.caption)
            .foregroundColor(.secondary)
          TextField("Name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onReceive(Just(name), perform: { newValue in
              validate()
            })

        }.padding(.vertical, 4.0)

        VStack(alignment: .leading, spacing: 6.0) {
          Text("Price in Dollars")
            .font(.caption)
            .foregroundColor(.secondary)
          TextField("Price", value: $price, formatter: Formatters.dollarFormatter)
            .keyboardType(.decimalPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onReceive(Just(price), perform: { newValue in
              validate()
            })
        }.padding(.vertical, 4.0)
      }

      Section {
        Button(action: {
          let newGame = Game(name: name, priceInDollars: price, serialNumber: game.serialNumber)
          gameStore.update(game: game, newValue: newGame)
        }, label: {
          Text("Save")
            .frame(maxWidth: .infinity)
            .frame(height: 55.0)
        })
        .disabled(!shouldEnableSaveButton)
      }

      if let selectedPhoto = selectedPhoto {
        Section(header: Text("Image")) {
          Image(uiImage: selectedPhoto)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.vertical)
        }
      }
    }
    .toolbar {
      ToolbarItem(placement: .bottomBar) {
        Button(action: {
          if UIImagePickerController.isSourceTypeAvailable(.camera) {
            isPhotoPickerActionSheetPresenting = true
          } else {
            isPhotoPickerPresenting = true
          }
        }) {
          Image(systemName: "camera")
          Text("Add an Image")
        }
      }
    }
    .actionSheet(isPresented: $isPhotoPickerActionSheetPresenting) {
      createActionSheet()
    }
    .sheet(isPresented: $isPhotoPickerPresenting) {
      PhotoPicker(sourceType: sourceType, selectedPhoto: $selectedPhoto)
    }
    .accentColor(.red)
  }
}

struct GameDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let gameStore = GameStore()
    let game = gameStore.createGame()
    GameDetailView(game: game, gameStore: gameStore)
  }
}
