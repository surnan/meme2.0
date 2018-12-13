//
//  MemeCreationController+UIImagePicker.swift
//  Meme-2.0
//
//  Created by admin on 12/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension MemeCreationController {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            backgroundImageView.image = editedImage  //if the image is cropped or moved by user
        } else if let originalImage = info[.originalImage] as? UIImage {
            backgroundImageView.image = originalImage //if user does nothing after selecting photo
        }
        dismiss(animated: true, completion: nil)
    }
}
