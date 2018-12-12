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
    
    var dummyTextFieldOne: UITextField = {
        var textField = UITextField()
        textField.text = "ONE ONE"
        return textField
    }()
    
    var dummyTextFieldTwo: UITextField = {
        var textField = UITextField()
        textField.text = "TWO TWO"
        return textField
    }()
    
    var dummyTextFieldThree: UITextField = {
        var textField = UITextField()
        textField.text = "THREE THREE"
        return textField
    }()
    
    var dummyImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        return imageView
    }()
    
    var dummyImage = UIImage(imageLiteralResourceName: "cry")
    var dummyImage2 = UIImage(imageLiteralResourceName: "surprised")
    var dummyImage3 = UIImage(imageLiteralResourceName: "blue_like")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
       
        
        //let secondController = UICollectionViewLayout()   //compiles but will crash when it loads on screen BUT you don't show elements
        ////ERROR:  UICollectionView: must be initialized with a non-nil layout parameter
        //let secondController = CollectionController(collectionViewLayout: UICollectionViewFlowLayout())  <-- That works
        
        //3 lines below will also work in case you don't wanna use the collectionView functions that mirror/mimic tableView
        //Can only get it to work before feeding it to secondController.  Not within the CollectionContoller--ViewDidLoad()
        //        let layout = UICollectionViewFlowLayout()
        //        layout.itemSize = CGSize(width: 100, height: 100)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 20)

        let firstController = TableController()
        firstController.tabBarItem =  UITabBarItem(title: "Table", image: #imageLiteral(resourceName: "table"), selectedImage: #imageLiteral(resourceName: "table"))
        let secondController = CollectionController(collectionViewLayout: UICollectionViewFlowLayout())
        secondController.tabBarItem = UITabBarItem(title: "Collection", image: #imageLiteral(resourceName: "collection"), selectedImage: #imageLiteral(resourceName: "collection"))
        
        

        let tabBarList = [firstController, secondController]
        viewControllers = tabBarList
        
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let currentMemeOne = Meme(topTxtField: dummyTextFieldOne, bottomTxtField: dummyTextField, originalImageView: dummyImageView, memeImage: dummyImage)
        let currentMemeTwo = Meme(topTxtField: dummyTextFieldTwo, bottomTxtField: dummyTextField, originalImageView: dummyImageView, memeImage: dummyImage2)
        let currentMemeThree = Meme(topTxtField: dummyTextFieldThree, bottomTxtField: dummyTextField, originalImageView: dummyImageView, memeImage: dummyImage3)
        myAppDelegate.memes.append(currentMemeOne)
        myAppDelegate.memes.append(currentMemeTwo)
        myAppDelegate.memes.append(currentMemeThree)
    }
}
