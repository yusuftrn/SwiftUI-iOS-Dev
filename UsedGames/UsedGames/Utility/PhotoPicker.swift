//
// Created by Yusuf Turan on 21.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import UIKit
import SwiftUI


/// This struct gives photolibrary and camera access for our app:
/// Dont forget to give privacy controls for access otherwise app will crash.
/// at info.plist add this 2 privacy settings:
/// -  Privacy - Camera Usage Description  !! for camera usage
/// -  Privacy - Photo Library Usage Description !! for save cameraroll to our file

struct PhotoPicker: UIViewControllerRepresentable {

  var sourceType: UIImagePickerController.SourceType = .photoLibrary
  @Binding var selectedPhoto: UIImage?

  func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> some UIViewController {
    let pickerController = UIImagePickerController()
    pickerController.allowsEditing = false
    pickerController.sourceType = sourceType
    pickerController.delegate = context.coordinator
    return pickerController
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    //
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photoPicker: PhotoPicker
    init(_ picker: PhotoPicker) {
      self.photoPicker = picker
      super.init()
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

      if let selectedPhoto = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
        photoPicker.selectedPhoto = selectedPhoto
        UIImageWriteToSavedPhotosAlbum(selectedPhoto, self, #selector(saveImageComplete(image:err:context:)), nil)
      } else {
        photoPicker.selectedPhoto = nil
      }
      picker.dismiss(animated: true, completion: nil)
    }

    @objc private func saveImageComplete(image:UIImage, err:NSError, context:UnsafeMutableRawPointer?) {
      //
    }
  }
}

