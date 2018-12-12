//
//  ShowMemeController+Gestures.swift
//  Meme-2.0
//
//  Created by admin on 12/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ShowMemeController{
    //MARK:- UIGesture Functions
    @objc func handleTap(sender: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        switch sender.direction {
        case .right, .up:
            showAnotherMeme(order: .next)
        case .left, .down:
            showAnotherMeme(order: .previous)
        default:
            break
        }
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer){
        let newVC = MemeCreationController()
        newVC.backgroundImageView.image = memeImageView.image
        newVC.bottomToolbar.isHidden = true
        newVC.topTextField.isHidden = true
        newVC.bottomTextField.isHidden = true
        present(newVC, animated: false)
    }
}
