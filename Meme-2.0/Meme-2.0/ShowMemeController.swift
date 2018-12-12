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
        
        loadAllGestures()   //Do we have Meme pre-loaded?
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

