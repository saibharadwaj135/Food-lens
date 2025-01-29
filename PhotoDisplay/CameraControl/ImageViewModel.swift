//
//  ImageViewModel.swift
//  PhotoDisplay
//
//  Created by Sai bharadwaj Adapa on 1/25/25.
//

import Foundation
import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showingImagePicker = false
    @Published var sourceType: UIImagePickerController.SourceType = .camera
    
    func showPhotoPicker() {
        sourceType = .photoLibrary
        showingImagePicker = true
    }
    
    func showCamera() {
        sourceType = .camera
        showingImagePicker = true
    }
}
