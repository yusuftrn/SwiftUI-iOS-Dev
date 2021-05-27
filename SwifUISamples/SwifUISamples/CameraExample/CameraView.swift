//
//  CameraView.swift
//  SwifUISamples
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct CameraView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            image?.resizable()
                .scaledToFit()
            
            Button("Open Camera") {
                self.showImagePicker = true
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
          
        }.sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
        }
    }
}
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      CameraView()
    }
  }
