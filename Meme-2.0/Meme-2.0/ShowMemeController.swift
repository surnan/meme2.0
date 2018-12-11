//
//  MemeViewer.swift
//  Meme-2.0
//
//  Created by admin on 12/10/18.
//  Copyright © 2018 admin. All rights reserved.

import UIKit

class ShowMemeController: UIViewController {
    
    var currentIndex = 0
    
    //Below code does not work
    /*
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
    */
    
        private var memes: [Meme]! {
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            return appDelegate.memes
        }
    
        private lazy var  memeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true  //requires lazy var
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = UIColor.white  //<-- swipe gestures don't trigger without this line
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))

        rightSwipe.direction = .right
        leftSwipe.direction = .left
        upSwipe.direction = .up
        downSwipe.direction = .down
        
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
        
        memeImageView.image = memes[currentIndex].finalImage
        view.addSubview(memeImageView)
        
        NSLayoutConstraint.activate([
            memeImageView.topAnchor.constraint(equalTo: view.topAnchor),
            memeImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            memeImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            memeImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            ])
    }
    
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
            switch sender.direction {
            case .right:
                print("RIGHT")
            case .left:
                print("LEFT")
            case .up:
                dismiss(animated: true, completion: nil)
            case .down:
                print("DOWN")
            default:
                break
            }
    }
}
