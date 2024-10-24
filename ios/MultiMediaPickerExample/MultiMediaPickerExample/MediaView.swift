import ExyteMediaPicker
import SwiftUI

struct MediaView: View {
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
      .sheet(isPresented: $showMediaPicker) {
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
        .mediaSelectionLimit(1)
        .showLiveCameraCell(true)
        .initialPickerMode(.camera)
      }
    }
  }
}

struct MediaView_Previews: PreviewProvider {
  static var previews: some View { MediaView() }
}
