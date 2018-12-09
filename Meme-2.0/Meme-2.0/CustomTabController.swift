//
//  YourTabBarController.swift
//  Meme-2.0
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CustomTabController: UITabBarController {

    
    var dummyTextField: UITextField = {
        var textField = UITextField()
        textField.text = "!!!WELCOME TO THE JUNGLE!!!"
        return textField
    }()
    
    var dummyImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        return imageView
    }()
    
    var dummyImage = UIImage(imageLiteralResourceName: "cry")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstController = TableController()
        firstController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondController = ContainerController()
        secondController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstController, secondController]
        viewControllers = tabBarList
        
        
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let currentMeme = Meme(topTxtField: dummyTextField, bottomTxtField: dummyTextField, originalImageView: dummyImageView, memeImage: dummyImage)
        myAppDelegate.memes.append(currentMeme)
        myAppDelegate.memes.append(currentMeme)
        myAppDelegate.memes.append(currentMeme)
        myAppDelegate.memes.append(currentMeme)
        myAppDelegate.memes.append(currentMeme)
    }
}
