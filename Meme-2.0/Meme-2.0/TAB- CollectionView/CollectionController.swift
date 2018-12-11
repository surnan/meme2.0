//
//  secondVC.swift
//  Meme-2.0
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

/*
 let layout = UICollectionViewFlowLayout()
 layout.scrollDirection = .horizontal
 let swipingController = SwipingController(collectionViewLayout: layout)
 window?.rootViewController = swipingController
 */

import UIKit

class CollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let reuseID = "zzzzzz"
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    //MARK:- CollectionView Functions

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("top string = \(memes[indexPath.item].top)")
    }
    
    
    //MARK:- View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.gray
        tabBarController?.title = "Sent Memes"
        collectionView.register(MemeCollectionViewCell.self, forCellWithReuseIdentifier: reuseID)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let currentMemeArray = myAppDelegate.memes
//        print("TableView ...Number of Elements in myAppDelegate.memes = \(currentMemeArray.count) \n\n")
//        print("CollectionController --> memeCount = \(memes.count)")
        collectionView.reloadData()
    }

    //MARK:- Collection View Functions
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tempCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as! MemeCollectionViewCell
        tempCell.currentMeme =  memes[indexPath.item]
        return tempCell
    }
}
