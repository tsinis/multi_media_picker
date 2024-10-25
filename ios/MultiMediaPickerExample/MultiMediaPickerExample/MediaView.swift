//
//  MediaView.swift
//  MultiMediaPickerExample
//
//  Created by Roman Cinis on 24.10.2024.
//

import ExyteMediaPicker
import Foundation
import SwiftUI

struct MediaView: View {
  @EnvironmentObject private var appDelegate: AppDelegate

  @State private var showMediaPicker = false
  @State private var medias: [Media] = []
  @State private var selectedImage: UIImage? = nil

  var body: some View {
    VStack {
      if let selectedImage = selectedImage {
        Image(uiImage: selectedImage)
          .resizable()
          .scaledToFit()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      } else {
        Text("No image selected")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }

      Button(action: {
        showMediaPicker = true
      }) {
        Text("Open Camera")
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(8)
      }
      .padding()
      .fullScreenCover(isPresented: $showMediaPicker) {
        MediaPicker(
          isPresented: $showMediaPicker,
          onChange: { newMedias in
            medias = newMedias
            if let firstMedia = medias.first, firstMedia.type == .image {
              Task {
                if let data = try? await firstMedia.getData() {
                  selectedImage = UIImage(data: data)
                }
              }
            }
          }
        )
        .cameraViewSettings(
          CameraViewSettings(
            cancelButtonText: "Hide",
            doneButtonText: "Perfect",
            showFlipCameraButton: true,
            showPhotoVideoToggle: false
          )
        )
        .didPressCancelCamera { showMediaPicker = false }
        .initialPickerMode(.camera)
        .mediaSelectionType(.photo)
        .mediaSelectionLimit(4)
        .orientationHandler {
          switch $0 {
          case .lock: appDelegate.lockOrientationToPortrait()
          case .unlock: appDelegate.unlockOrientation()
          }
        }
      }
    }
  }
}

struct MediaView_Previews: PreviewProvider {
  static var previews: some View {
    MediaView()
  }
}
