//
//  MemeCreationController+Gestures.swift
//  Meme-2.0
//
//  Created by admin on 12/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension MemeCreationController{
    
    
    
    enum MemeSequence {
        case next
        case previous
    }
    
    private var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    func showAnotherMeme(order: MemeSequence) {
        let upperLimit = memes.count - 1
        let lowerLimit = 0
        
        if order == .next {
            currentIndex = currentIndex < upperLimit ? currentIndex + 1 : 0
        } else {
            currentIndex = currentIndex > lowerLimit ? currentIndex - 1 : upperLimit
        }
        backgroundImageView.image = memes[currentIndex].finalImage
    }
    
    func loadAllGestures(){
        typealias swipe = UISwipeGestureRecognizer.Direction
        
        [swipe.up, swipe.down, swipe.left, swipe.right].forEach{
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            gesture.direction = $0
            self.backgroundImageView.addGestureRecognizer(gesture)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        backgroundImageView.addGestureRecognizer(tapGesture)
        backgroundImageView.addGestureRecognizer(longTapGesture)
    }
    
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
        newVC.backgroundImageView.image = backgroundImageView.image
        newVC.bottomToolbar.isHidden = true
        newVC.topTextField.isHidden = true
        newVC.bottomTextField.isHidden = true
        present(newVC, animated: false)
    }
}
