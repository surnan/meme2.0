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
        textField.text = "Jungle"
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
        
        
        //let secondController = UICollectionViewLayout()   //compiles but will crash when it loads on screen BUT you don't show elements
        ////ERROR:  UICollectionView: must be initialized with a non-nil layout parameter
        //let secondController = CollectionController(collectionViewLayout: UICollectionViewFlowLayout())  <-- That works
        
        //3 lines below will also work in case you don't wanna use the collectionView functions that mirror/mimic tableView
        //Can only get it to work before feeding it to secondController.  Not within the CollectionContoller--ViewDidLoad()
        //        let layout = UICollectionViewFlowLayout()
        //        layout.itemSize = CGSize(width: 100, height: 100)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 20)
        
        
        let secondController = CollectionController(collectionViewLayout: UICollectionViewFlowLayout())
        secondController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstController, secondController]
        viewControllers = tabBarList
        
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let currentMeme = Meme(topTxtField: dummyTextField, bottomTxtField: dummyTextField, originalImageView: dummyImageView, memeImage: dummyImage)
        myAppDelegate.memes.append(currentMeme)
        myAppDelegate.memes.append(currentMeme)
    }
}
