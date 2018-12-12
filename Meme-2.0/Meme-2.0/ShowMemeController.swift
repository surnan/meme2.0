//
//  ShowMemeController.swift
//  Meme-2.0
//
//  Created by admin on 12/10/18.
//  Copyright © 2018 admin. All rights reserved.

import UIKit

class ShowMemeController: UIViewController {
    
    var currentIndex = 0
    
    enum MemeSequence {
        case next
        case previous
    }
    
    private var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    lazy var  memeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true  //requires lazy var
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func loadAllGestures(){
        typealias swipe = UISwipeGestureRecognizer.Direction
        
        [swipe.up, swipe.down, swipe.left, swipe.right].forEach{
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            gesture.direction = $0
            self.memeImageView.addGestureRecognizer(gesture)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        memeImageView.addGestureRecognizer(tapGesture)
        memeImageView.addGestureRecognizer(longTapGesture)
    }
    
    func showAnotherMeme(order: MemeSequence) {
        let upperLimit = memes.count - 1
        let lowerLimit = 0
        
        if order == .next {
            currentIndex = currentIndex < upperLimit ? currentIndex + 1 : 0
        } else {
            currentIndex = currentIndex > lowerLimit ? currentIndex - 1 : upperLimit
        }
        memeImageView.image = memes[currentIndex].finalImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllGestures()
        //        view.addGestureRecognizer(rightSwipe)
        //        view.addGestureRecognizer(leftSwipe)
        //        view.addGestureRecognizer(upSwipe)
        //        view.addGestureRecognizer(downSwipe)
        
        memeImageView.image = memes[currentIndex].finalImage
        view.addSubview(memeImageView)
        NSLayoutConstraint.activate([
            memeImageView.topAnchor.constraint(equalTo: view.topAnchor),
            memeImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            memeImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            memeImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            ])
    }
}

