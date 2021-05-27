//
//  ContentView.swift
//  CoreDataImageDetect
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct ContentView: View {
  let images = ["cat1", "furki", "husky", "kurt", "vasak"]
  @State private var selectedImage = ""
  @ObservedObject private var imageDetectionVM: ImageDetectionViewModel
  private var imageDetectionManager: ImageDetectionManager
  init() {
    self.imageDetectionManager = ImageDetectionManager()
    self.imageDetectionVM = ImageDetectionViewModel(manager: self.imageDetectionManager)
  }
  var body: some View {
    NavigationView {
      VStack {
        ScrollView([.horizontal]) {
          HStack {
            ForEach(self.images, id:\.self) { image in
              Image(image)
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                .onTapGesture {
                  self.selectedImage = image
                }
                .border(Color.black, width: self.selectedImage == image ? 10 : 0)
            }
          }
        }
        Button {
          self.imageDetectionVM.detect(self.selectedImage)
        } label: {
          Text("Detect Image")
            .padding(10)
            .background(Color.orange)
            .background(Color.white)
            .cornerRadius(10)
        }
        Text("Prediction: \(self.imageDetectionVM.predictionLabel)")
      }
      .navigationBarTitle("ML Example")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
