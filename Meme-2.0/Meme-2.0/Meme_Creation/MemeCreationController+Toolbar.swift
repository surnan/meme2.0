//
//  MemeController+Toolbar.swift
//  Meme_1
//
//  Created by admin on 11/15/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension MemeCreationController {
    //MARK:- Both Toolbars
    func showTopAndBottomToolbars(makeVisible: Bool){
        if !makeVisible {
            bottomToolbar.isHidden = true
            topToolbar.isHidden = true
        } else {
            topToolbar.isHidden = false
            bottomToolbar.isHidden = false
        }
    }
    
    //MARK:- TOP Toolbars & BarButtons
    func setupTopToolBar(){
        let barButtonOne = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleCancelBarButton))
        let barButtonTwo = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleShareBarButton))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,target: nil,action: nil)
        topToolbar.setItems([barButtonOne, flexibleSpace ,barButtonTwo], animated: false)
    }
    

    
    @objc func handleCancelBarButton() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- BOTTOM Toolbars & BarButtons
    func setupBottomToolBar(){
        let myImage = #imageLiteral(resourceName: "camera2")
        let barButtonOne = UIBarButtonItem(image: myImage, style: .plain, target: self, action: #selector(handleCameraBarButton))
        let barButtonTwo = UIBarButtonItem(title: "Album", style: .done, target: self, action: #selector(handleAlbumBarButton))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,target: nil,action: nil)
        //Camera check for enabling BarButtonTwo
        barButtonOne.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera) ? true : false
        bottomToolbar.setItems([flexibleSpace, barButtonOne, flexibleSpace ,barButtonTwo,flexibleSpace], animated: false)
    }
    
    @objc func handleAlbumBarButton() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleCameraBarButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK:- Create/Send Meme Functions
    func generateMemedImage() -> UIImage {
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return memedImage
    }
    
    func saveMeme()-> Meme {
        showTopAndBottomToolbars(makeVisible: false)
        let currentMeme = Meme(topTxtField: topTextField, bottomTxtField: bottomTextField, originalImageView: backgroundImageView, memeImage: generateMemedImage())
        showTopAndBottomToolbars(makeVisible: true)
        return currentMeme
    }
    
    @objc func handleShareBarButton() {
        let currentMeme = saveMeme()
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        myAppDelegate.memes.append(currentMeme)
        let items = [currentMeme.finalImage]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityVC.completionWithItemsHandler = {[unowned self](activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
        present(activityVC, animated: true)
    }
}
